import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model/option.dart';

@Cliarify()
class Default extends CliarifyBase {
  final aaa = StringOption(
    defaultsTo: 'aaa',
    abbr: "a",
    aliases: ['bbb'],
  );

  final number = IntOption(
    defaultsTo: 0,
  );

  @override
  void run() {
    print(aaa.value);
    print(number.value);
  }
}
