import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class StringPositional extends PositionalArgs<String>
    with StringParser, DefaultValue<String, String>, SingleValue<String, String, String> {
  StringPositional({
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

class NullableStringPositional extends PositionalArgs<String?>
    with StringParser, NullableValue<String, String>, SingleValue<String, String, String?> {
  NullableStringPositional({
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

class IntPositional extends PositionalArgs<int>
    with IntParser, DefaultValue<int, String>, SingleValue<int, String, int> {
  IntPositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final int? maxValue;
  @override
  final int? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(int)? parsedValidator;
  @override
  final int? defaultsTo;
  @override
  String Function(int input)? stringify;
}

class NullableIntPositional extends PositionalArgs<int?>
    with IntParser, NullableValue<int, String>, SingleValue<int, String, int?> {
  NullableIntPositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final int? maxValue;
  @override
  final int? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(int)? parsedValidator;
  @override
  String Function(int input)? stringify;
}

class DoublePositional extends PositionalArgs<double>
    with DoubleParser, DefaultValue<double, String>, SingleValue<double, String, double> {
  DoublePositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final double? maxValue;
  @override
  final double? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(double)? parsedValidator;
  @override
  final double? defaultsTo;
  @override
  String Function(double input)? stringify;
}

class NullableDoublePositional extends PositionalArgs<double?>
    with DoubleParser, NullableValue<double, String>, SingleValue<double, String, double?> {
  NullableDoublePositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final double? maxValue;
  @override
  final double? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(double)? parsedValidator;
  @override
  String Function(double input)? stringify;
}

class NumPositional extends PositionalArgs<num>
    with NumParser, DefaultValue<num, String>, SingleValue<num, String, num> {
  NumPositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final num? maxValue;
  @override
  final num? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(num)? parsedValidator;
  @override
  final num? defaultsTo;
  @override
  String Function(num input)? stringify;
}

class NullableNumPositional extends PositionalArgs<num?>
    with NumParser, NullableValue<num, String>, SingleValue<num, String, num?> {
  NullableNumPositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final num? maxValue;
  @override
  final num? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(num)? parsedValidator;
  @override
  String Function(num input)? stringify;
}

class DateTimePositional extends PositionalArgs<DateTime>
    with DateTimeParser, DefaultValue<DateTime, String>, SingleValue<DateTime, String, DateTime> {
  DateTimePositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final DateTime? maxValue;
  @override
  final DateTime? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(DateTime)? parsedValidator;
  @override
  final DateTime? defaultsTo;
  @override
  String Function(DateTime input)? stringify;
}

class NullableDateTimePositional extends PositionalArgs<DateTime?>
    with DateTimeParser, NullableValue<DateTime, String>, SingleValue<DateTime, String, DateTime?> {
  NullableDateTimePositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final DateTime? maxValue;
  @override
  final DateTime? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(DateTime)? parsedValidator;
  @override
  String Function(DateTime input)? stringify;
}

class MillisecondsDurationPositional extends PositionalArgs<Duration>
    with MillisecondsDurationParser, DefaultValue<Duration, String>, SingleValue<Duration, String, Duration> {
  MillisecondsDurationPositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final Duration? maxValue;
  @override
  final Duration? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Duration)? parsedValidator;
  @override
  final Duration? defaultsTo;
  @override
  String Function(Duration input)? stringify;
}

class NullableMillisecondsDurationPositional extends PositionalArgs<Duration?>
    with MillisecondsDurationParser, NullableValue<Duration, String>, SingleValue<Duration, String, Duration?> {
  NullableMillisecondsDurationPositional({
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final Duration? maxValue;
  @override
  final Duration? minValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Duration)? parsedValidator;
  @override
  String Function(Duration input)? stringify;
}

class UriPositional extends PositionalArgs<Uri>
    with UriParser, DefaultValue<Uri, String>, SingleValue<Uri, String, Uri> {
  UriPositional({
    this.schemes,
    this.allowRelative = false,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final List<String>? schemes;
  @override
  final bool allowRelative;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Uri)? parsedValidator;
  @override
  final Uri? defaultsTo;
  @override
  String Function(Uri input)? stringify;
}

class NullableUriPositional extends PositionalArgs<Uri?>
    with UriParser, NullableValue<Uri, String>, SingleValue<Uri, String, Uri?> {
  NullableUriPositional({
    this.schemes,
    this.allowRelative = false,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final List<String>? schemes;
  @override
  final bool allowRelative;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Uri)? parsedValidator;
  @override
  String Function(Uri input)? stringify;
}

class EnumPositional<T extends Enum> extends PositionalArgs<T>
    with EnumParser<T>, DefaultValue<T, String>, SingleValue<T, String, T> {
  EnumPositional({
    required this.allowed,
    super.description,
    this.validator,
    this.parsedValidator,
    this.stringify,
    this.defaultsTo,
  });
  @override
  final Iterable<T> allowed;
  @override
  final T? defaultsTo;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(T)? parsedValidator;
  @override
  String Function(T input)? stringify;
}

class NullableEnumPositional<T extends Enum> extends PositionalArgs<T?>
    with EnumParser<T>, NullableValue<T, String>, SingleValue<T, String, T?> {
  NullableEnumPositional({
    required this.allowed,
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
  String Function(T input)? stringify;
}
