import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/parser.dart';

class StringMultiOptionArgs extends MultiOptionArgs<List<String>>
    with DefaultValue<List<String>, List<String>>, StringParser, ListValue<String, String, List<String>> {
  StringMultiOptionArgs({
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
  final List<String>? defaultsTo;
  @override
  String getHelp() {
    return 'string';
  }
}

class NullableStringMultiOptionArgs extends MultiOptionArgs<List<String>?>
    with StringParser, NullableValue<List<String>, List<String>>, ListValue<String, String, List<String>?> {
  NullableStringMultiOptionArgs({
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
  String getHelp() {
    return 'string';
  }
}
