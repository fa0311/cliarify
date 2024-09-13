import 'package:args/args.dart';
import 'package:cliarify/error.dart';
import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class CliarifyUtil {
  static void parserInit({
    required ArgParser parser,
    required List<String> args,
    required Map<String, Args> fields,
  }) {
    for (final field in fields.entries) {
      final key = field.key;
      final value = field.value;

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
  }) {
    try {
      return parser.parse(args);
    } on ArgParserException catch (e) {
      throw CliarifyMissingArgumentException(
        message: e.message,
        name: e.source,
      );
    }
  }

  static void build({
    required Map<String, Args> fields,
    required ArgResults results,
  }) {
    for (final field in fields.entries) {
      final key = field.key;
      final value = field.value;
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
        throw CliarifyMissingArgumentException(
          message: e.message,
          name: key,
          description: "$key is required",
        );
      }
    }
  }

  static void printHelp(Map<String, Args> fields) {
    for (final field in fields.entries) {
      final key = field.key;
      final value = field.value;
      print('$key: ${value.getHelp()}');
    }
  }
}

abstract class CliarifyBase {
  Map<String, Args> get cliarifyOptionFields => {};

  run();

  CliarifyBase.cliarifyFromArgs(List<String> args) {
    final parser = ArgParser();
    CliarifyUtil.parserInit(parser: parser, args: args, fields: cliarifyOptionFields);
    final results = CliarifyUtil.parse(parser: parser, args: args);
    CliarifyUtil.build(fields: cliarifyOptionFields, results: results);
  }
}
