import 'package:cliarify/base.dart';
import 'package:cliarify/error.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model/flag.dart';
import 'package:cliarify/model/option.dart';
import 'package:test/test.dart';

@Cliarify()
class TestString extends CliarifyBase {
  final string = StringOption();

  @override
  run() {
    throw UnimplementedError();
  }
}

@Cliarify()
class TestBool extends CliarifyBase {
  final bool = BoolFlag(defaultsTo: null);

  @override
  run() {
    throw UnimplementedError();
  }
}

void main() {
  test('Command Parse String', () {
    try {
      final _ = TestString.cliarifyFromArgs(["-a"]);
      fail('Expected an UnimplementedError to be thrown');
    } on CliarifyException catch (e) {
      print(e.printError());
    }
  });
  test('Command Parse Bool', () {
    try {
      final _ = TestBool.cliarifyFromArgs([]);
      fail('Expected an UnimplementedError to be thrown');
    } on CliarifyException catch (e) {
      print(e.printError());
    }
  });
}
