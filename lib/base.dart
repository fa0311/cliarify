import 'package:args/args.dart';
import 'package:cliarify/color.dart';
import 'package:cliarify/model.dart';

class CliarifyArgValue {
  final String message;
  final String name;
  final String description;

  CliarifyArgValue({
    required this.message,
    required this.name,
    required this.description,
  });
}

class CliarifyErrorPrinterMessage {
  final CliarifyColorPalette config;
  static pluralize(int len, String singular, String plural) {
    return len == 1 ? singular : plural;
  }

  String indent(List<String> text) {
    return text.map((e) => ' ${config.red("»")}   $e').join('\n');
  }

  String seeMoreHelp() {
    return 'See more help with --help';
  }

  String missingErrorTitle(int len) {
    return 'Error: Missing $len required ${pluralize(len, 'arg', 'args')}:';
  }

  String argParse(CliarifyArgValue data) {
    return '${data.name}  ${data.description}';
  }

  String missingError(CliarifyMissingArgumentException data) {
    final len = data.value.length;
    final args = data.value.map((e) => argParse(e)).toList();
    return indent([missingErrorTitle(len), ...args, seeMoreHelp()]);
  }

  CliarifyErrorPrinterMessage([CliarifyColorPalette? config]) : config = CliarifyColorPalette();
}

abstract class CliarifyException implements Exception {
  CliarifyException();
  String printError([CliarifyErrorPrinterMessage? config]);
}

class CliarifyMissingArgumentException implements CliarifyException {
  final List<CliarifyArgValue> value;

  CliarifyMissingArgumentException(this.value);

  @override
  String printError([CliarifyErrorPrinterMessage? config]) {
    final conf = config ?? CliarifyErrorPrinterMessage();
    return conf.missingError(this);
  }
}

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
      } else {
        throw ArgumentError('Invalid field type');
      }
    }
  }

  static void parse({
    required Map<String, Args> fields,
    required ArgResults results,
  }) {
    final errors = <CliarifyArgValue>[];
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
        } else {
          throw ArgumentError('Invalid field type');
        }
      } on CliarifyParseException catch (e) {
        errors.add(CliarifyArgValue(
          message: e.message,
          name: key,
          description: value.getHelp(),
        ));
      }
    }
    if (errors.isNotEmpty) {
      throw CliarifyMissingArgumentException(errors);
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
    final results = parser.parse(args);
    CliarifyUtil.parse(fields: cliarifyOptionFields, results: results);
  }
}
