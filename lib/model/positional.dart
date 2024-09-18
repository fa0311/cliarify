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
