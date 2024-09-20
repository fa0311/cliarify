import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class StringPositionalArgs extends PositionalArgs<String>
    with StringParser, DefaultValue<String, String>, SingleValue<String, String, String> {
  StringPositionalArgs({
    super.description,
    super.hidden,
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

class NullableStringPositionalArgs extends PositionalArgs<String?>
    with StringParser, NullableValue<String, String>, SingleValue<String, String, String?> {
  NullableStringPositionalArgs({
    super.description,
    super.hidden,
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

class IntPositionalArgs extends PositionalArgs<int>
    with IntParser, DefaultValue<int, String>, SingleValue<int, String, int> {
  IntPositionalArgs({
    super.description,
    super.hidden,
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

class NullableIntPositionalArgs extends PositionalArgs<int?>
    with IntParser, NullableValue<int, String>, SingleValue<int, String, int?> {
  NullableIntPositionalArgs({
    super.description,
    super.hidden,
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

class DoublePositionalArgs extends PositionalArgs<double>
    with DoubleParser, DefaultValue<double, String>, SingleValue<double, String, double> {
  DoublePositionalArgs({
    super.description,
    super.hidden,
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

class NullableDoublePositionalArgs extends PositionalArgs<double?>
    with DoubleParser, NullableValue<double, String>, SingleValue<double, String, double?> {
  NullableDoublePositionalArgs({
    super.description,
    super.hidden,
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

class NumPositionalArgs extends PositionalArgs<num>
    with NumParser, DefaultValue<num, String>, SingleValue<num, String, num> {
  NumPositionalArgs({
    super.description,
    super.hidden,
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

class NullableNumPositionalArgs extends PositionalArgs<num?>
    with NumParser, NullableValue<num, String>, SingleValue<num, String, num?> {
  NullableNumPositionalArgs({
    super.description,
    super.hidden,
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

class DateTimePositionalArgs extends PositionalArgs<DateTime>
    with DateTimeParser, DefaultValue<DateTime, String>, SingleValue<DateTime, String, DateTime> {
  DateTimePositionalArgs({
    super.description,
    super.hidden,
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

class NullableDateTimePositionalArgs extends PositionalArgs<DateTime?>
    with DateTimeParser, NullableValue<DateTime, String>, SingleValue<DateTime, String, DateTime?> {
  NullableDateTimePositionalArgs({
    super.description,
    super.hidden,
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

class MillisecondsDurationPositionalArgs extends PositionalArgs<Duration>
    with MillisecondsDurationParser, DefaultValue<Duration, String>, SingleValue<Duration, String, Duration> {
  MillisecondsDurationPositionalArgs({
    super.description,
    super.hidden,
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

class NullableMillisecondsDurationPositionalArgs extends PositionalArgs<Duration?>
    with MillisecondsDurationParser, NullableValue<Duration, String>, SingleValue<Duration, String, Duration?> {
  NullableMillisecondsDurationPositionalArgs({
    super.description,
    super.hidden,
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

class UriPositionalArgs extends PositionalArgs<Uri>
    with UriParser, DefaultValue<Uri, String>, SingleValue<Uri, String, Uri> {
  UriPositionalArgs({
    super.description,
    super.hidden,
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

class NullableUriPositionalArgs extends PositionalArgs<Uri?>
    with UriParser, NullableValue<Uri, String>, SingleValue<Uri, String, Uri?> {
  NullableUriPositionalArgs({
    super.description,
    super.hidden,
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

class EnumPositionalArgs<T extends Enum> extends PositionalArgs<T>
    with EnumParser<T>, DefaultValue<T, String>, SingleValue<T, String, T> {
  EnumPositionalArgs({
    super.description,
    super.hidden,
    required this.allowed,
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

class NullableEnumPositionalArgs<T extends Enum> extends PositionalArgs<T?>
    with EnumParser<T>, NullableValue<T, String>, SingleValue<T, String, T?> {
  NullableEnumPositionalArgs({
    super.description,
    super.hidden,
    required this.allowed,
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
