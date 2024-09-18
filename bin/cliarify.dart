import 'package:cliarify/main.dart';
import 'package:cliarify/message/error.dart';

void main(List<String> args) {
  try {
    Default().cliarifyParseArgs(args)?.cliarifyRun();
  } on CliarifyException catch (e) {
    print(e.printError());
  }
}
