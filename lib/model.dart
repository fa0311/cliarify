class CliarifyFormatException implements Exception {
  final String message;

  CliarifyFormatException(this.message);

  @override
  String toString() {
    return 'CliarifyFormatException: $message';
  }
}

mixin DefaultValueParser<T> {
  T? get defaultsTo;
  T orThrow(T? input) {
    final value = input ?? defaultsTo;
    if (value == null) {
      throw CliarifyFormatException('No default value');
    }
    return value;
  }
}

mixin StringParser {
  int? get minLength;
  int? get maxLength;

  String? validate(String? input) {
    if (input == null) {
      return null;
    } else {
      if (minLength != null && input.length < minLength!) {
        throw CliarifyFormatException('String is too short');
      }
      if (maxLength != null && input.length > maxLength!) {
        throw CliarifyFormatException('String is too long');
      }
      return input;
    }
  }
}

mixin IntParser {
  int? get minValue;
  int? get maxValue;

  int? validate(String? input) {
    if (input == null) {
      return null;
    }
    if (input.isEmpty) {
      throw CliarifyFormatException('Empty string is not allowed');
    }
    if (int.tryParse(input) == null) {
      throw CliarifyFormatException('Not a valid number');
    }
    final parsed = int.parse(input);
    if (minValue != null && parsed < minValue!) {
      throw CliarifyFormatException('Number is too small');
    }
    if (maxValue != null && parsed > maxValue!) {
      throw CliarifyFormatException('Number is too big');
    }
    return parsed;
  }
}

mixin EnumParser<T extends Enum> {
  Iterable<T> get allowed;
  T? validate(String? input) {
    if (input == null) {
      return null;
    }
    if (input.isEmpty) {
      throw CliarifyFormatException('Empty string is not allowed');
    }
    if (!allowed.any((element) => element.name == input)) {
      throw CliarifyFormatException('Not a valid enum value');
    }
    return allowed.byName(input);
  }
}

abstract class Args<T> {
  final List<String> aliases;
  final String? abbr;
  late T value;

  Args({
    this.aliases = const [],
    this.abbr,
  });

  String getHelp();
}

abstract class OptionArgs<T> extends Args<T> {
  OptionArgs({
    super.aliases,
    super.abbr,
  });

  T parse(String? input);
}

abstract class FlagArgs<T> extends Args<T> {
  final bool negatable;

  FlagArgs({
    this.negatable = false,
    super.aliases,
    super.abbr,
  });
  T parse(bool? input);
}

class BoolFlag extends FlagArgs<bool> with DefaultValueParser<bool> {
  BoolFlag({
    super.aliases,
    super.abbr,
    super.negatable = false,
    this.defaultsTo = false,
  });
  @override
  final bool? defaultsTo;

  @override
  bool parse(bool? input) => orThrow(input);

  @override
  String getHelp() {
    return 'bool';
  }
}

class NullableBoolFlag extends FlagArgs<bool?> {
  NullableBoolFlag({
    super.aliases,
    super.abbr,
    super.negatable = false,
    this.defaultsTo = false,
  });

  final bool? defaultsTo;

  @override
  bool? parse(bool? input) => input ?? defaultsTo;

  @override
  String getHelp() {
    return 'bool';
  }
}

class StringOption extends OptionArgs<String>
    with StringParser, DefaultValueParser<String> {
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
  String parse(String? input) => orThrow(validate(input));
  @override
  String getHelp() {
    return 'string';
  }
}

class NullableStringOption extends OptionArgs<String?> with StringParser {
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
  String? parse(String? input) => validate(input);

  @override
  String getHelp() {
    return 'string';
  }
}

class IntOption extends OptionArgs<int>
    with IntParser, DefaultValueParser<int> {
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
  int parse(String? input) => orThrow(validate(input));

  @override
  String getHelp() {
    return 'int';
  }
}

class NullableIntOption extends OptionArgs<int?> with IntParser {
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
  int? parse(String? input) => validate(input);

  @override
  String getHelp() {
    return 'int';
  }
}

class EnumOption<T extends Enum> extends OptionArgs<T>
    with EnumParser<T>, DefaultValueParser<T> {
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
  T parse(String? input) => orThrow(validate(input));

  @override
  String getHelp() {
    return allowed.map((e) => e.name).join('|');
  }
}

class NullableEnumOption<T extends Enum> extends OptionArgs<T?>
    with EnumParser<T> {
  NullableEnumOption({
    required this.allowed,
    super.aliases,
    super.abbr,
  });

  @override
  final Iterable<T> allowed;

  @override
  T? parse(String? input) => validate(input);

  @override
  String getHelp() {
    return allowed.map((e) => e.name).join('|');
  }
}
