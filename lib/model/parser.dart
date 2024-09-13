class CliarifyParseException implements Exception {
  final String message;

  CliarifyParseException(this.message);

  @override
  String toString() {
    return 'CliarifyFormatException: $message';
  }
}

mixin SingleValue<T, U, V> {
  T validate(U input);
  V convert(U? input, T Function(U) validate);
  V parse(U? input) => convert(input, validate);
}

mixin ListValue<T, U, V> {
  T validate(U input);
  V convert(List<U>? input, List<T> Function(List<U>) validate);
  V parse(List<U>? input) => convert(input, (x) => x.map(validate).toList());
}

mixin DefaultValue<T, U> {
  T? get defaultsTo;

  T convert(U? input, T Function(U) validate) {
    if (input != null) {
      return validate(input);
    } else if (defaultsTo != null) {
      return defaultsTo!;
    } else {
      throw CliarifyParseException('Value is required');
    }
  }
}

mixin NullableValue<T, U> {
  T? convert(U? input, T Function(U) validate) {
    if (input != null) {
      return validate(input);
    } else {
      return null;
    }
  }
}

mixin StringParser {
  int? get minLength;
  int? get maxLength;

  String validate(String input) {
    if (minLength != null && input.length < minLength!) {
      throw CliarifyParseException('String is too short');
    }
    if (maxLength != null && input.length > maxLength!) {
      throw CliarifyParseException('String is too long');
    }
    return input;
  }
}

mixin IntParser {
  int? get minValue;
  int? get maxValue;

  int validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException('Empty string is not allowed');
    }
    if (int.tryParse(input) == null) {
      throw CliarifyParseException('Not a valid number');
    }
    final parsed = int.parse(input);
    if (minValue != null && parsed < minValue!) {
      throw CliarifyParseException('Number is too small');
    }
    if (maxValue != null && parsed > maxValue!) {
      throw CliarifyParseException('Number is too big');
    }
    return parsed;
  }
}

mixin EnumParser<T extends Enum> {
  Iterable<T> get allowed;
  T validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException('Empty string is not allowed');
    }
    if (!allowed.any((element) => element.name == input)) {
      throw CliarifyParseException('Not a valid enum value');
    }
    return allowed.byName(input);
  }
}
