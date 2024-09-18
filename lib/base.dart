import 'package:args/args.dart';
import 'package:cliarify/color.dart';
import 'package:cliarify/message/error.dart';
import 'package:cliarify/message/help.dart';
import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';
import 'package:cliarify/util.dart';

class CliarifyUtil {
  static void Function(CliarifyBase)? exclusiveFlagCheck({
    required List<String> args,
    required Map<String, Args> fields,
  }) {
    final parser = ArgParser();
    for (final (key, value) in fields.tuple) {
      if (value.exclusive != null) {
        if (value is FlagArgs) {
          parser.addFlag(
            key,
            abbr: value.abbr,
            aliases: value.aliases,
          );
        }
      }
    }
    try {
      final results = parser.parse(args);
      for (final (key, value) in fields.tuple) {
        if (value is FlagArgs) {
          final data = results.options.contains(key) ? results.flag(key) : false;
          if (data && value.exclusive != null) {
            return value.exclusive;
          }
        }
      }
    } on ArgParserException {
      return null;
    }
    return null;
  }

  static void parserInit({
    required ArgParser parser,
    required List<String> args,
    required Map<String, Args> fields,
  }) {
    for (final (key, value) in fields.tuple) {
      if (value is OptionArgs) {
        parser.addOption(
          key,
          abbr: value.abbr,
          aliases: value.aliases,
          defaultsTo: null,
        );
      } else if (value is FlagArgs) {
        parser.addFlag(
          key,
          abbr: value.abbr,
          aliases: value.aliases,
          negatable: value.negatable,
          defaultsTo: null,
        );
      } else if (value is MultiOptionArgs) {
        parser.addMultiOption(
          key,
          abbr: value.abbr,
          aliases: value.aliases,
          defaultsTo: null,
        );
      } else {
        throw ArgumentError('Invalid field type');
      }
    }
  }

  static ArgResults parse({
    required ArgParser parser,
    required List<String> args,
    required Map<String, Args> fields,
  }) {
    try {
      return parser.parse(args);
    } on ArgParserException catch (e) {
      throw CliarifyException(
        title: (config) => config.optionNotFoundError,
        name: e.source,
      );
    }
  }

  static void build({
    required Map<String, Args> fields,
    required ArgResults results,
  }) {
    for (final (key, value) in fields.tuple) {
      try {
        if (value is OptionArgs) {
          final data = results.options.contains(key) ? results.option(key) : null;
          value.value = value.parse(data);
        } else if (value is FlagArgs) {
          final data = results.options.contains(key) ? results.flag(key) : null;
          value.value = value.parse(data);
        } else if (value is MultiOptionArgs) {
          final data = results.options.contains(key) ? results.multiOption(key) : null;
          value.value = value.parse(data);
        } else {
          throw ArgumentError('Invalid field type');
        }
      } on CliarifyParseException catch (e) {
        throw CliarifyException(
          title: e.title,
          name: results.actual(key) ?? "--$key",
          description: value.description,
        );
      }
    }
  }
}

abstract class CliarifyBase {
  String get cliarifyGeneratedName;
  Map<String, Args> get cliarifyOptionGeneratedFields;

  String get cliarifyName => cliarifyGeneratedName;
  Map<String, Args> get cliarifyOptionFields => cliarifyOptionGeneratedFields;

  String cliarifyHelp([CliarifyColorPalette? config]) {
    final palette = config ?? CliarifyColorPalette();
    final help = CliarifyHelpPrinterMessage(cliarifyName, cliarifyOptionFields, config);
    final data = {
      'USAGE': help.usageParse(),
      'FLAG': help.flagParse(),
    };
    return data.entries.map((e) => [palette.bold(e.key), e.value].join('\n')).join('\n\n');
  }

  cliarifyRun();

  cliarifyParseArgs(List<String> args) {
    final exclusive = CliarifyUtil.exclusiveFlagCheck(args: args, fields: cliarifyOptionFields);
    if (exclusive == null) {
      final parser = ArgParser();
      CliarifyUtil.parserInit(parser: parser, args: args, fields: cliarifyOptionFields);
      final results = CliarifyUtil.parse(parser: parser, args: args, fields: cliarifyOptionFields);
      CliarifyUtil.build(fields: cliarifyOptionFields, results: results);
      return this;
    } else {
      exclusive(this);
    }
  }
}
