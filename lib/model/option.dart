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

class DoubleOption extends OptionArgs<double>
    with DoubleParser, DefaultValue<double, String>, SingleValue<double, String, double> {
  DoubleOption({
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
  final double? minValue;
  @override
  final double? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(double)? parsedValidator;
  @override
  final String Function(double input)? stringify;
  @override
  final double? defaultsTo;
}

class NullableDoubleOption extends OptionArgs<double?>
    with DoubleParser, NullableValue<double, String>, SingleValue<double, String, double?> {
  NullableDoubleOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final double? minValue;
  @override
  final double? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(double)? parsedValidator;
  @override
  final String Function(double input)? stringify;
}

class NumOption extends OptionArgs<num> with NumParser, DefaultValue<num, String>, SingleValue<num, String, num> {
  NumOption({
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
  final num? minValue;
  @override
  final num? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(num)? parsedValidator;
  @override
  final String Function(num input)? stringify;
  @override
  final num? defaultsTo;
}

class NullableNumOption extends OptionArgs<num?>
    with NumParser, NullableValue<num, String>, SingleValue<num, String, num?> {
  NullableNumOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final num? minValue;
  @override
  final num? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(num)? parsedValidator;
  @override
  final String Function(num input)? stringify;
}

class DateTimeOption extends OptionArgs<DateTime>
    with DateTimeParser, DefaultValue<DateTime, String>, SingleValue<DateTime, String, DateTime> {
  DateTimeOption({
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
  final DateTime? minValue;
  @override
  final DateTime? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(DateTime)? parsedValidator;
  @override
  final String Function(DateTime input)? stringify;
  @override
  final DateTime? defaultsTo;
}

class NullableDateTimeOption extends OptionArgs<DateTime?>
    with DateTimeParser, NullableValue<DateTime, String>, SingleValue<DateTime, String, DateTime?> {
  NullableDateTimeOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final DateTime? minValue;
  @override
  final DateTime? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(DateTime)? parsedValidator;
  @override
  final String Function(DateTime input)? stringify;
}

class MillisecondsDurationOption extends OptionArgs<Duration>
    with MillisecondsDurationParser, DefaultValue<Duration, String>, SingleValue<Duration, String, Duration> {
  MillisecondsDurationOption({
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
  final Duration? minValue;
  @override
  final Duration? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Duration)? parsedValidator;
  @override
  final String Function(Duration input)? stringify;
  @override
  final Duration? defaultsTo;
}

class NullableMillisecondsDurationOption extends OptionArgs<Duration?>
    with MillisecondsDurationParser, NullableValue<Duration, String>, SingleValue<Duration, String, Duration?> {
  NullableMillisecondsDurationOption({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.stringify,
  });
  @override
  final Duration? minValue;
  @override
  final Duration? maxValue;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Duration)? parsedValidator;
  @override
  final String Function(Duration input)? stringify;
}

class UriOption extends OptionArgs<Uri> with UriParser, DefaultValue<Uri, String>, SingleValue<Uri, String, Uri> {
  UriOption({
    super.aliases,
    super.abbr,
    super.description,
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
  final String Function(Uri input)? stringify;
  @override
  final Uri? defaultsTo;
}

class NullableUriOption extends OptionArgs<Uri?>
    with UriParser, NullableValue<Uri, String>, SingleValue<Uri, String, Uri?> {
  NullableUriOption({
    super.aliases,
    super.abbr,
    super.description,
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
  final String Function(Uri input)? stringify;
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
