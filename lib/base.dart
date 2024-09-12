import 'package:args/args.dart';
import 'package:cliarify/model.dart';

abstract class CliarifyBase {
  Map<String, Args> get cliarifyOptionFields => {};

  run();

  CliarifyBase.cliarifyFromArgs(List<String> args) {
    final parser = ArgParser();
    for (final field in cliarifyOptionFields.entries) {
      final key = field.key;
      final value = field.value;

      if (value is OptionArgs) {
        parser.addOption(
          key,
          abbr: value.abbr,
          aliases: value.aliases,
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

    final results = parser.parse(args);
    for (final field in cliarifyOptionFields.entries) {
      final key = field.key;
      final value = field.value;
      if (value is OptionArgs) {
        final data = results.options.contains(key) ? results.option(key) : null;
        value.value = value.parse(data);
      } else if (value is FlagArgs) {
        final data = results.options.contains(key) ? results.flag(key) : null;
        value.value = value.parse(data);
      } else {
        throw ArgumentError('Invalid field type');
      }
    }
  }
}
