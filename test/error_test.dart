import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model.dart';
import 'package:test/test.dart';

@Cliarify()
class TestString extends CliarifyBase {
  final string = StringOption();

  @override
  run() {
    throw UnimplementedError();
  }
}

void main() {
  test('Command Parse String', () {
    try {
      final _ = TestString.cliarifyFromArgs([]);
      fail('Expected an UnimplementedError to be thrown');
    } on CliarifyException catch (e) {
      print(e.printError());
    }
  });
}
