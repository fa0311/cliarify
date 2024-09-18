import 'dart:collection';

import 'package:args/args.dart';
import 'package:cliarify/base.dart';
import 'package:cliarify/message/error.dart';
import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';
import 'package:cliarify/util.dart';

class CliarifyExclusiveParser {
  static bool check({
    required CliarifyBase base,
    required List<String> args,
    required Map<String, Args> fields,
  }) {
    final parser = ArgParser();
    build(parser: parser, args: args, fields: fields);
    try {
      final results = parser.parse(args);
      return flagParser(
        base: base,
        parentName: [],
        fields: fields,
        results: results,
      );
    } on ArgParserException {
      return false;
    }
  }

  static build({
    required ArgParser parser,
    required List<String> args,
    required Map<String, Args> fields,
  }) {
    for (final (key, value) in fields.tuple) {
      if (value is SubCommand) {
        final child = ArgParser();
        build(parser: child, args: args, fields: value.value.cliarifyOptionFields);
        parser.addCommand(key, child);
      } else if (value is FlagArgs && value.exclusive != null) {
        parser.addFlag(
          key,
          abbr: value.abbr,
          aliases: value.aliases,
        );
      }
    }
  }

  static bool flagParser({
    required CliarifyBase base,
    required List<String> parentName,
    required Map<String, Args> fields,
    required ArgResults results,
  }) {
    base.cliarifyParentName.addAll(parentName);
    for (final (key, value) in fields.tuple) {
      if (results.command != null) {
        for (final (key, value) in fields.tuple) {
          if (value is SubCommand && results.command!.name == key) {
            return flagParser(
              base: value.value,
              parentName: [...parentName, base.cliarifyName],
              fields: value.value.cliarifyOptionFields,
              results: results.command!,
            );
          }
        }
        throw ArgumentError('Invalid field type');
      } else if (value is FlagArgs) {
        final data = results.options.contains(key) ? results.flag(key) : false;
        if (data && value.exclusive != null) {
          value.exclusive!(base);
          return true;
        }
      }
    }
    return false;
  }
}

class CliarifyParser {
  static void subCommandInit({
    required Map<String, Args> fields,
  }) {
    for (final (_, value) in fields.tuple) {
      if (value is SubCommand) {
        value.value = value.builder();
        subCommandInit(fields: value.value.cliarifyOptionFields);
      }
    }
  }

  static void parserInit({
    required ArgParser parser,
    required Map<String, Args> fields,
  }) {
    for (final (key, value) in fields.tuple) {
      if (value is SubCommand) {
        final child = ArgParser();
        parserInit(parser: child, fields: value.value.cliarifyOptionFields);
        parser.addCommand(key, child);
      } else if (value is OptionArgs) {
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
      } else if (value is PositionalArgs) {
      } else if (value is RestArgs) {
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

  static CliarifyBase? build({
    required Map<String, Args> fields,
    required ArgResults results,
  }) {
    if (results.command != null) {
      for (final (key, value) in fields.tuple) {
        if (value is SubCommand) {
          if (results.command!.name == key) {
            final child = value.builder();
            build(fields: child.cliarifyOptionFields, results: results.command!);
            return child;
          }
        }
      }
      throw ArgumentError('Invalid field type');
    }

    Queue<String> rest = Queue.from(results.rest);

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
        } else if (value is PositionalArgs) {
          final data = rest.isNotEmpty ? rest.removeFirst() : null;
          value.value = value.parse(data);
        } else if (value is RestArgs) {
          final data = List.generate(rest.length, (_) => rest.removeFirst());
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
    return null;
  }
}
