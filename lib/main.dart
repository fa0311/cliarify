import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model.dart';

@Cliarify()
class Default extends CliarifyBase {
  final aaa = StringArgs(
    defaultsTo: 'aaa',
    abbr: "a",
    aliases: ['bbb'],
  );

  final number = IntArgs(
    defaultsTo: 0,
  );

  @override
  void run() {
    print(aaa.value);
    print(number.value);
  }
}
