import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class StringOption extends OptionArgs<String>
    with StringParser, DefaultValue<String, String>, SingleValue<String, String, String> {
  StringOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minLength,
    this.maxLength,
    this.pattern,
    this.validator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final int? maxLength;
  @override
  final int? minLength;
  @override
  final RegExp? pattern;
  @override
  final bool Function(String)? validator;
  @override
  final String Function(String input)? stringify;
  @override
  final String? defaultsTo;
}

class NullableStringOption extends OptionArgs<String?>
    with StringParser, NullableValue<String, String>, SingleValue<String, String, String?> {
  NullableStringOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minLength,
    this.maxLength,
    this.pattern,
    this.validator,
    this.stringify,
  });
  @override
  final int? maxLength;
  @override
  final int? minLength;
  @override
  final RegExp? pattern;
  @override
  final bool Function(String)? validator;
  @override
  final String Function(String input)? stringify;
}

class IntOption extends OptionArgs<int> with IntParser, DefaultValue<int, String>, SingleValue<int, String, int> {
  IntOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final int? minValue;
  @override
  final int? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(int)? parsedValidator;
  @override
  final String Function(int input)? stringify;
  @override
  final int? defaultsTo;
}

class NullableIntOption extends OptionArgs<int?>
    with IntParser, NullableValue<int, String>, SingleValue<int, String, int?> {
  NullableIntOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.stringify,
    this.parsedValidator,
  });

  @override
  final int? minValue;
  @override
  final int? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final String Function(int input)? stringify;
  @override
  final bool Function(int)? parsedValidator;
}

class EnumOption<T extends Enum> extends OptionArgs<T>
    with EnumParser<T>, DefaultValue<T, String>, SingleValue<T, String, T> {
  EnumOption({
    required this.allowed,
    super.aliases,
    super.abbr,
    super.description,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final T? defaultsTo;
  @override
  final Iterable<T> allowed;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(T)? parsedValidator;
  @override
  final String Function(T input)? stringify;
}

class NullableEnumOption<T extends Enum> extends OptionArgs<T?>
    with EnumParser<T>, NullableValue<T, String>, SingleValue<T, String, T?> {
  NullableEnumOption({
    required this.allowed,
    super.aliases,
    super.abbr,
    super.description,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final Iterable<T> allowed;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(T)? parsedValidator;
  @override
  final String Function(T input)? stringify;
}
