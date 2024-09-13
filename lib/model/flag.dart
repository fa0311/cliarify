import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class BoolFlag extends FlagArgs<bool> with DefaultValue<bool, bool>, SingleValue<bool, bool, bool> {
  BoolFlag({
    super.aliases,
    super.abbr,
    super.negatable = false,
    this.defaultsTo = false,
  });
  @override
  final bool? defaultsTo;
  @override
  bool validate(bool input) => input;
  @override
  String getHelp() {
    return 'bool';
  }
}

class NullableBoolFlag extends FlagArgs<bool?> with NullableValue<bool?, bool>, SingleValue<bool?, bool, bool?> {
  NullableBoolFlag({
    super.aliases,
    super.abbr,
    super.negatable = false,
    this.defaultsTo = false,
  });
  final bool? defaultsTo;
  @override
  bool? validate(bool? input) => input;
  @override
  String getHelp() {
    return 'bool';
  }
}
