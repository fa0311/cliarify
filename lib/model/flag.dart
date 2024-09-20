import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class BoolFlag extends FlagArgs<bool> with DefaultValue<bool, bool>, SingleValue<bool, bool, bool> {
  BoolFlag({
    super.description,
    super.hidden,
    super.aliases,
    super.abbr,
    super.exclusive,
    super.negatable = false,
    this.defaultsTo = false,
  });
  @override
  final bool? defaultsTo;
  @override
  bool parse(bool? input);
  @override
  bool validate(bool input) => input;
  @override
  String valueToString(bool value) => value.toString();
}

class NullableBoolFlag extends FlagArgs<bool?> with NullableValue<bool?, bool>, SingleValue<bool?, bool, bool?> {
  NullableBoolFlag({
    super.description,
    super.hidden,
    super.aliases,
    super.abbr,
    super.exclusive,
    super.negatable = false,
  });
  @override
  bool? validate(bool input) => input;
  @override
  String? defaultConvert(String Function(bool? input) validate) => null;
  @override
  String valueToString(bool? value) => value.toString();
}
