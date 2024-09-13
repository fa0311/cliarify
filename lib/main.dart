import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model/flag.dart';
import 'package:cliarify/model/option.dart';

@Cliarify()
class Default extends CliarifyBase {
  final sayConsole = StringOption(
    defaultsTo: 'aaa',
    abbr: "s",
    aliases: ['say'],
    description: 'Say something to the console',
  );
  final help = BoolFlag(
    abbr: "h",
    description: 'Prints help information',
  );

  @override
  void cliarifyRun() {
    if (help.value) {
      print(cliarifyHelp());
      return;
    }
    print(sayConsole.value);
  }
}
