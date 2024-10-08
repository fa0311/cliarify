import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model/flag.dart';
import 'package:cliarify/model/option.dart';
import 'package:test/test.dart';

@Cliarify()
class TestString extends CliarifyBase {
  final nullableString = NullableStringOption();
  final defaultString = StringOption(defaultsTo: 'default');
  final aliasString = NullableStringOption(aliases: ['alias']);
  final abbrString = NullableStringOption(abbr: 'a');

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

@Cliarify()
class TestBool extends CliarifyBase {
  final normalFlag = BoolFlag();
  final defaultFlag = BoolFlag(defaultsTo: true);
  final negatableFlag = BoolFlag(negatable: true, defaultsTo: true);
  final aliasFlag = BoolFlag(aliases: ['alias']);
  final abbrFlag = BoolFlag(abbr: 'a');

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

void main() {
  test('Command Parse String', () {
    final res1 = TestString().cliarifyParseArgs<TestString>([])!;
    expect(res1.nullableString.value, null);
    expect(res1.defaultString.value, 'default');

    final res2 = TestString().cliarifyParseArgs<TestString>(['--nullable-string', 'test'])!;
    expect(res2.nullableString.value, 'test');

    final res3 = TestString().cliarifyParseArgs<TestString>(['--default-string', 'test'])!;
    expect(res3.defaultString.value, 'test');

    final res4 = TestString().cliarifyParseArgs<TestString>(['--alias-string', 'test'])!;
    expect(res4.aliasString.value, 'test');

    final res5 = TestString().cliarifyParseArgs<TestString>(['--alias', 'test'])!;
    expect(res5.aliasString.value, 'test');

    final res6 = TestString().cliarifyParseArgs<TestString>(['--abbr-string', 'test'])!;
    expect(res6.abbrString.value, 'test');

    final res7 = TestString().cliarifyParseArgs<TestString>(['-a', 'test'])!;
    expect(res7.abbrString.value, 'test');
  });

  test('Command Parse Bool', () {
    final res1 = TestBool().cliarifyParseArgs<TestBool>([])!;
    expect(res1.normalFlag.value, false);
    expect(res1.defaultFlag.value, true);
    expect(res1.negatableFlag.value, true);
    expect(res1.aliasFlag.value, false);
    expect(res1.abbrFlag.value, false);

    final res2 = TestBool().cliarifyParseArgs<TestBool>(['--normal-flag'])!;
    expect(res2.normalFlag.value, true);

    final res3 = TestBool().cliarifyParseArgs<TestBool>(['--default-flag'])!;
    expect(res3.defaultFlag.value, true);

    final res4 = TestBool().cliarifyParseArgs<TestBool>(['--no-negatable-flag'])!;
    expect(res4.negatableFlag.value, false);

    final res5 = TestBool().cliarifyParseArgs<TestBool>(['--alias-flag'])!;
    expect(res5.aliasFlag.value, true);

    final res6 = TestBool().cliarifyParseArgs<TestBool>(['--alias'])!;
    expect(res6.aliasFlag.value, true);

    final res7 = TestBool().cliarifyParseArgs<TestBool>(['-a'])!;
    expect(res7.abbrFlag.value, true);
  });
}
