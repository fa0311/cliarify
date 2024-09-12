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
          negatable: value.negatable,
        );
      } else {
        throw ArgumentError('Invalid field type');
      }
    }

    final results = parser.parse(args);
    for (final field in cliarifyOptionFields.entries) {
      final key = field.key;
      final value = field.value;
      final resultValue = results.options.contains(key) ? results[key] : null;
      if (value is OptionArgs) {
        value.value = value.parse(resultValue);
      } else if (value is FlagArgs) {
        value.value = value.parse(resultValue);
      } else {
        throw ArgumentError('Invalid field type');
      }
    }
  }
}
