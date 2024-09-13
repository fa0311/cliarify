import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class StringOption extends OptionArgs<String>
    with StringParser, DefaultValue<String, String>, SingleValue<String, String, String> {
  StringOption({
    super.aliases,
    super.abbr,
    this.minLength,
    this.maxLength,
    this.defaultsTo,
  });
  @override
  final int? maxLength;
  @override
  final int? minLength;
  @override
  final String? defaultsTo;
  @override
  String getHelp() {
    return 'string';
  }
}

class NullableStringOption extends OptionArgs<String?>
    with StringParser, NullableValue<String, String>, SingleValue<String, String, String?> {
  NullableStringOption({
    super.aliases,
    super.abbr,
    this.minLength,
    this.maxLength,
  });
  @override
  final int? maxLength;
  @override
  final int? minLength;
  @override
  String getHelp() {
    return 'string';
  }
}

class IntOption extends OptionArgs<int> with IntParser, DefaultValue<int, String>, SingleValue<int, String, int> {
  IntOption({
    super.aliases,
    super.abbr,
    this.minValue,
    this.maxValue,
    this.defaultsTo,
  });
  @override
  final int? minValue;
  @override
  final int? maxValue;
  @override
  final int? defaultsTo;
  @override
  String getHelp() {
    return 'int';
  }
}

class NullableIntOption extends OptionArgs<int?>
    with IntParser, NullableValue<int, String>, SingleValue<int, String, int?> {
  NullableIntOption({
    super.aliases,
    super.abbr,
    this.minValue,
    this.maxValue,
  });

  @override
  final int? minValue;
  @override
  final int? maxValue;
  @override
  String getHelp() {
    return 'int';
  }
}

class EnumOption<T extends Enum> extends OptionArgs<T>
    with EnumParser<T>, DefaultValue<T, String>, SingleValue<T, String, T> {
  EnumOption({
    required this.allowed,
    this.defaultsTo,
    super.aliases,
    super.abbr,
  });
  @override
  final T? defaultsTo;
  @override
  final Iterable<T> allowed;
  @override
  String getHelp() {
    return allowed.map((e) => e.name).join('|');
  }
}

class NullableEnumOption<T extends Enum> extends OptionArgs<T?>
    with EnumParser<T>, NullableValue<T, String>, SingleValue<T, String, T?> {
  NullableEnumOption({
    required this.allowed,
    super.aliases,
    super.abbr,
  });
  @override
  final Iterable<T> allowed;
  @override
  String getHelp() {
    return allowed.map((e) => e.name).join('|');
  }
}
