import 'package:cliarify/message/error.dart';

class CliarifyParseException implements Exception {
  final String Function(CliarifyErrorPrinterMessage) title;
  CliarifyParseException(this.title);
}

mixin SingleValue<T, U, V> {
  T validate(U input);
  V convert(U? input, T Function(U) validate);
  V parse(U? input) => convert(input, validate);
  String? defaultConvert(String Function(T) validate);
  String valueToString(T value);
  String? defaultDescription() {
    return defaultConvert((x) => valueToString(x));
  }
}

mixin ListValue<T, U, V> {
  T validate(U input);
  V convert(List<U>? input, List<T> Function(List<U>) validate);
  V parse(List<U>? input) => convert(input, (x) => x.map(validate).toList());
  String? defaultConvert(String Function(List<T>) validate);
  String valueToString(T value);
  String Function(List<T>)? get listStringify;
  String? defaultDescription() {
    if (listStringify == null) {
      return defaultConvert((x) => x.map(valueToString).join(','));
    } else {
      return defaultConvert((x) => listStringify!(x));
    }
  }
}

mixin DefaultValue<T, U> {
  T? get defaultsTo;
  String? defaultConvert(String Function(T) validate) {
    if (defaultsTo != null) {
      return validate(defaultsTo as T);
    } else {
      return null;
    }
  }

  T convert(U? input, T Function(U) validate) {
    if (input != null) {
      return validate(input);
    } else if (defaultsTo != null) {
      return defaultsTo!;
    } else {
      throw CliarifyParseException((e) => e.requiredArgumentMissingError);
    }
  }
}

mixin NullableValue<T, U> {
  String? defaultConvert(String Function(T) validate) => null;
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
  RegExp? get pattern;
  bool Function(String)? get validator;
  String Function(String)? get stringify;

  String valueToString(String value) {
    return stringify != null ? stringify!(value) : value;
  }

  String validate(String input) {
    if (minLength != null && input.length < minLength!) {
      throw CliarifyParseException((e) => e.stringTooShortError);
    }
    if (maxLength != null && input.length > maxLength!) {
      throw CliarifyParseException((e) => e.stringTooLongError);
    }
    if (pattern != null && !pattern!.hasMatch(input)) {
      throw CliarifyParseException((e) => e.stringPatternMismatchError);
    }
    return input;
  }
}

mixin IntParser {
  int? get minValue;
  int? get maxValue;
  bool Function(String)? get validator;
  bool Function(int)? get parsedValidator;
  String Function(int)? get stringify;

  String valueToString(int value) {
    return stringify != null ? stringify!(value) : value.toString();
  }

  int validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException((e) => e.emptyStringNotAllowedError);
    }
    if (int.tryParse(input) == null) {
      throw CliarifyParseException((e) => e.invalidNumberError);
    }
    final parsed = int.parse(input);
    if (minValue != null && parsed < minValue!) {
      throw CliarifyParseException((e) => e.numberTooSmallError);
    }
    if (maxValue != null && parsed > maxValue!) {
      throw CliarifyParseException((e) => e.numberTooLargeError);
    }
    if (validator != null) {
      validator!(input);
    }
    if (parsedValidator != null) {
      !parsedValidator!(parsed);
    }
    return parsed;
  }
}

mixin DoubleParser {
  double? get minValue;
  double? get maxValue;
  bool Function(String)? get validator;
  bool Function(double)? get parsedValidator;
  String Function(double)? get stringify;

  String valueToString(double value) {
    return (stringify ?? (x) => x.toString())(value);
  }

  double validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException((e) => e.emptyStringNotAllowedError);
    }
    if (double.tryParse(input) == null) {
      throw CliarifyParseException((e) => e.invalidNumberError);
    }
    final parsed = double.parse(input);
    if (minValue != null && parsed < minValue!) {
      throw CliarifyParseException((e) => e.numberTooSmallError);
    }
    if (maxValue != null && parsed > maxValue!) {
      throw CliarifyParseException((e) => e.numberTooLargeError);
    }

    if (validator != null) {
      validator!(input);
    }
    if (parsedValidator != null) {
      !parsedValidator!(parsed);
    }
    return parsed;
  }
}

mixin NumParser {
  int? get minValue;
  int? get maxValue;
  bool Function(String)? get validator;
  bool Function(num)? get parsedValidator;
  String Function(num)? get stringify;

  String valueToString(num value) {
    return (stringify ?? (x) => x.toString())(value);
  }

  num validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException((e) => e.emptyStringNotAllowedError);
    }
    if (num.tryParse(input) == null) {
      throw CliarifyParseException((e) => e.invalidNumberError);
    }
    final parsed = num.parse(input);
    if (minValue != null && parsed < minValue!) {
      throw CliarifyParseException((e) => e.numberTooSmallError);
    }
    if (maxValue != null && parsed > maxValue!) {
      throw CliarifyParseException((e) => e.numberTooLargeError);
    }
    if (validator != null) {
      validator!(input);
    }
    if (parsedValidator != null) {
      !parsedValidator!(parsed);
    }
    return parsed;
  }
}

mixin DateTimeParser {
  DateTime? get minValue;
  DateTime? get maxValue;
  bool Function(String)? get validator;
  bool Function(DateTime)? get parsedValidator;
  String Function(DateTime)? get stringify;

  String valueToString(DateTime value) {
    return (stringify ?? (x) => x.toString())(value);
  }

  DateTime validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException((e) => e.emptyStringNotAllowedError);
    }
    if (DateTime.tryParse(input) == null) {
      throw CliarifyParseException((e) => e.invalidDateError);
    }
    final parsed = DateTime.parse(input);
    if (minValue != null && parsed.isBefore(minValue!)) {
      throw CliarifyParseException((e) => e.dateTooEarlyError);
    }
    if (maxValue != null && parsed.isAfter(maxValue!)) {
      throw CliarifyParseException((e) => e.dateTooLateError);
    }
    if (validator != null) {
      validator!(input);
    }
    if (parsedValidator != null) {
      !parsedValidator!(parsed);
    }
    return parsed;
  }
}

mixin MillisecondsDurationParser {
  Duration? get minValue;
  Duration? get maxValue;
  bool Function(String)? get validator;
  bool Function(Duration)? get parsedValidator;
  String Function(Duration)? get stringify;

  String valueToString(Duration value) {
    return (stringify ?? (x) => x.inMilliseconds.toString())(value);
  }

  Duration validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException((e) => e.emptyStringNotAllowedError);
    }
    if (int.tryParse(input) == null) {
      throw CliarifyParseException((e) => e.invalidDurationError);
    }
    final parsed = Duration(milliseconds: int.parse(input));
    if (minValue != null && parsed < minValue!) {
      throw CliarifyParseException((e) => e.durationTooShortError);
    }
    if (maxValue != null && parsed > maxValue!) {
      throw CliarifyParseException((e) => e.durationTooLongError);
    }
    if (validator != null) {
      validator!(input);
    }
    if (parsedValidator != null) {
      !parsedValidator!(parsed);
    }
    return parsed;
  }
}

mixin UriParser {
  List<String>? get schemes;
  bool get allowRelative;
  bool Function(String)? get validator;
  bool Function(Uri)? get parsedValidator;
  String Function(Uri)? get stringify;

  String valueToString(Uri value) {
    return (stringify ?? (x) => x.toString())(value);
  }

  Uri validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException((e) => e.emptyStringNotAllowedError);
    }
    if (Uri.tryParse(input) == null) {
      throw CliarifyParseException((e) => e.invalidUriError);
    }
    final parsed = Uri.parse(input);
    if (schemes != null && !schemes!.contains(parsed.scheme)) {
      throw CliarifyParseException((e) => e.uriSchemeNotAllowedError);
    }
    if (!allowRelative && !parsed.isAbsolute) {
      throw CliarifyParseException((e) => e.relativeUriNotAllowedError);
    }
    if (validator != null) {
      validator!(input);
    }
    if (parsedValidator != null) {
      !parsedValidator!(parsed);
    }
    return parsed;
  }
}

mixin EnumParser<T extends Enum> {
  Iterable<T> get allowed;
  bool Function(String)? get validator;
  bool Function(T)? get parsedValidator;
  String Function(T)? get stringify;

  String valueToString(T value) {
    return (stringify ?? (x) => x.name)(value);
  }

  List<String>? enumDescription() {
    return allowed.map((e) => valueToString(e)).toList();
  }

  T validate(String input) {
    if (input.isEmpty) {
      throw CliarifyParseException((e) => e.emptyStringNotAllowedError);
    }
    if (!allowed.any((element) => element.name == input)) {
      throw CliarifyParseException((e) => e.invalidEnumValueError);
    }
    final parsed = allowed.byName(input);
    if (validator != null) {
      validator!(input);
    }
    if (parsedValidator != null) {
      !parsedValidator!(parsed);
    }
    return parsed;
  }
}
