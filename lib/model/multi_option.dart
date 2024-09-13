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
