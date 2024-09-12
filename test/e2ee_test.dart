import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

@Cliarify()
class TestString extends CliarifyBase {
  final normal = NullableStringArgs();
  final defaultString = StringArgs(
    defaultsTo: 'default',
  );

  @override
  run() {
    throw UnimplementedError();
  }
}

void main() {
  test('Command Parse', () {
    final res = TestString.cliarifyFromArgs(['--normal', 'aaa']);
    expect(res.normal.value, 'aaa');
    expect(res.defaultString.value, 'default');

    final res2 = TestString.cliarifyFromArgs(['--default-string', 'aaa']);
    expect(res2.normal.value, null);
    expect(res2.defaultString.value, 'aaa');
  });
}
