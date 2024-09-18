import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class StringMultiOptionArgs extends MultiOptionArgs<List<String>>
    with DefaultValue<List<String>, List<String>>, StringParser, ListValue<String, String, List<String>> {
  StringMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.minLength,
    this.maxLength,
    this.pattern,
    this.validator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
  });
  @override
  final int? minLength;
  @override
  final int? maxLength;
  @override
  final RegExp? pattern;
  @override
  final bool Function(String)? validator;
  @override
  final List<String>? defaultsTo;
  @override
  final String Function(String input)? stringify;
  @override
  final String Function(List<String> input)? listStringify;
}

class IntMultiOptionArgs extends MultiOptionArgs<List<int>>
    with DefaultValue<List<int>, List<String>>, IntParser, ListValue<int, String, List<int>> {
  IntMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
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
  final List<int>? defaultsTo;
  @override
  String Function(int input)? stringify;
  @override
  String Function(List<int> input)? listStringify;
}

class DoubleMultiOptionArgs extends MultiOptionArgs<List<double>>
    with DefaultValue<List<double>, List<String>>, DoubleParser, ListValue<double, String, List<double>> {
  DoubleMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
  });
  @override
  final double? minValue;
  @override
  final double? maxValue;
  @override
  final List<double>? defaultsTo;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(double)? parsedValidator;
  @override
  final String Function(double input)? stringify;

  @override
  final String Function(List<double> input)? listStringify;
}

class NumMultiOptionArgs extends MultiOptionArgs<List<num>>
    with DefaultValue<List<num>, List<String>>, NumParser, ListValue<num, String, List<num>> {
  NumMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
  });
  @override
  final num? minValue;
  @override
  final num? maxValue;
  @override
  final List<num>? defaultsTo;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(num)? parsedValidator;
  @override
  final String Function(num input)? stringify;
  @override
  final String Function(List<num> input)? listStringify;
}

class DateTimeMultiOptionArgs extends MultiOptionArgs<List<DateTime>>
    with DefaultValue<List<DateTime>, List<String>>, DateTimeParser, ListValue<DateTime, String, List<DateTime>> {
  DateTimeMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
  });
  @override
  final DateTime? minValue;
  @override
  final DateTime? maxValue;
  @override
  final List<DateTime>? defaultsTo;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(DateTime)? parsedValidator;
  @override
  final String Function(DateTime input)? stringify;
  @override
  final String Function(List<DateTime> input)? listStringify;
}

class MillisecondsDurationMultiOptionArgs extends MultiOptionArgs<List<Duration>>
    with
        DefaultValue<List<Duration>, List<String>>,
        MillisecondsDurationParser,
        ListValue<Duration, String, List<Duration>> {
  MillisecondsDurationMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.minValue,
    this.maxValue,
    this.validator,
    this.parsedValidator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
  });
  @override
  final Duration? minValue;
  @override
  final Duration? maxValue;
  @override
  final List<Duration>? defaultsTo;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Duration)? parsedValidator;
  @override
  final String Function(Duration input)? stringify;
  @override
  final String Function(List<Duration> input)? listStringify;
}

class UriMultiOptionArgs extends MultiOptionArgs<List<Uri>>
    with DefaultValue<List<Uri>, List<String>>, UriParser, ListValue<Uri, String, List<Uri>> {
  UriMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.schemes,
    this.allowRelative = false,
    this.validator,
    this.parsedValidator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
  });
  @override
  final List<String>? schemes;
  @override
  final bool allowRelative;
  @override
  final List<Uri>? defaultsTo;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(Uri)? parsedValidator;
  @override
  final String Function(Uri input)? stringify;
  @override
  final String Function(List<Uri> input)? listStringify;
}

class EnumMultiOptionArgs<T extends Enum> extends MultiOptionArgs<List<T>>
    with DefaultValue<List<T>, List<String>>, EnumParser<T>, ListValue<T, String, List<T>> {
  EnumMultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
    this.allowed = const [],
    this.validator,
    this.parsedValidator,
    this.defaultsTo,
    this.stringify,
    this.listStringify,
  });
  @override
  final Iterable<T> allowed;
  @override
  final List<T>? defaultsTo;
  @override
  final bool Function(String)? validator;
  @override
  final bool Function(T)? parsedValidator;
  @override
  final String Function(T input)? stringify;
  @override
  final String Function(List<T> input)? listStringify;
}
