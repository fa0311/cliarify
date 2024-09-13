import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model/flag.dart';
import 'package:cliarify/model/option.dart';
import 'package:test/test.dart';

enum TestEnum { apple, banana, cherry }

@Cliarify()
class TestHelp extends CliarifyBase {
  final example = StringOption(aliases: ['example-example'], abbr: 'e', defaultsTo: 'example');
  final enumString = EnumOption(allowed: TestEnum.values, defaultsTo: TestEnum.apple);
  final nullableString = NullableStringOption(aliases: ['nullable-string'], abbr: 'n');
  final flag = BoolFlag(abbr: 'f', negatable: true);

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

void main() {
  test('Command Help', () {
    TestHelp().cliarifyHelp();
  });
}
