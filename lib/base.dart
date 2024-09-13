import 'package:args/args.dart';
import 'package:cliarify/color.dart';
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
}

class HelpUtil {
  final CliarifyColorPalette config;
  final Map<String, Args> fields;
  HelpUtil(this.fields, [CliarifyColorPalette? config]) : config = CliarifyColorPalette();

  List<List<String>> helpParse() {
    final res = <List<String>>[];
    for (final field in fields.entries) {
      final key = field.key;
      final value = field.value;
      if (!value.hidden) {
        if (value is ArgsDescription) {
          final defaultDescription = value.defaultDescription();
          final enumDescription = value.enumDescription();
          final line = <String>[];

          line.add(value.abbr == null ? '' : '-${value.abbr}, ');

          if (value is FlagArgs && value.negatable) {
            line.add([...value.aliases, key].map((e) => '--[no-]$e').join(', '));
          } else if (enumDescription != null) {
            line.add('${[...value.aliases, key].map((e) => '--$e').join(', ')}=${config.underline("<options>  ")}');
          } else if (value is OptionArgs) {
            line.add('${[...value.aliases, key].map((e) => '--$e').join(', ')}=${config.underline("<value>")}  ');
          } else {
            line.add('${[...value.aliases, key].map((e) => '--$e').join(', ')}  ');
          }

          line.add(defaultDescription == null ? '' : '[default: $defaultDescription]  ');
          line.add(enumDescription == null ? '' : '<options: $enumDescription>  ');
          line.add(value.description ?? '');

          res.add(line);
        }
      }
    }
    return res;
  }

  void printHelp() {
    final table = helpParse();
    final maxLength = table.fold<List<int>>(List.filled(table.first.length, 0), (prev, element) {
      for (var i = 0; i < element.length; i++) {
        prev[i] = prev[i] > element[i].length ? prev[i] : element[i].length;
      }
      return prev;
    });

    final res = table.map((row) {
      return row.asMap().entries.map((e) {
        final length = e.value.replaceAll(RegExp(r'\u001B\[\d+m'), '').length;
        final space = ' ' * (maxLength[e.key] - length);
        return '${config.bold(e.value)}$space';
      }).join('');
    }).toList();
    print(res.join('\n'));
  }
}

abstract class CliarifyBase {
  Map<String, Args> get cliarifyOptionFields => {};

  void help([CliarifyColorPalette? config]) {
    HelpUtil(cliarifyOptionFields, config).printHelp();
  }

  run();

  cliarifyParseArgs(List<String> args) {
    final parser = ArgParser();
    CliarifyUtil.parserInit(parser: parser, args: args, fields: cliarifyOptionFields);
    final results = CliarifyUtil.parse(parser: parser, args: args);
    CliarifyUtil.build(fields: cliarifyOptionFields, results: results);
    return this;
  }
}
