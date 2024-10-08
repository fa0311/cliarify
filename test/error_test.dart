import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/message/error.dart';
import 'package:cliarify/model/flag.dart';
import 'package:cliarify/model/option.dart';
import 'package:test/test.dart';

@Cliarify()
class TestOption extends CliarifyBase {
  final string = StringOption(description: "This is a string");
  final int = IntOption(description: "This is a number");

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

@Cliarify()
class TestFlag extends CliarifyBase {
  final bool = BoolFlag(defaultsTo: null, description: "This is a flag");

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

void main() {
  test('Command Parse Option', () {
    try {
      TestOption().cliarifyParseArgs<TestOption>(["--aaaa"]);
      fail('Expected an UnimplementedError to be thrown');
    } on CliarifyException catch (e) {
      print(e.printError());
    }

    try {
      TestOption().cliarifyParseArgs<TestOption>([]);
      fail('Expected an UnimplementedError to be thrown');
    } on CliarifyException catch (e) {
      print(e.printError());
    }

    try {
      TestOption().cliarifyParseArgs<TestOption>(["--string", "a", "--int", "size"]);
      fail('Expected an UnimplementedError to be thrown');
    } on CliarifyException catch (e) {
      print(e.printError());
    }
  });

  test('Command Parse Bool', () {
    try {
      TestFlag().cliarifyParseArgs<TestFlag>([]);
      fail('Expected an UnimplementedError to be thrown');
    } on CliarifyException catch (e) {
      print(e.printError());
    }
  });
}
