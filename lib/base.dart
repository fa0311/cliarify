import 'package:args/args.dart';
import 'package:cliarify/color.dart';
import 'package:cliarify/message/help.dart';
import 'package:cliarify/model/base.dart';
import 'package:cliarify/parser.dart';

abstract class CliarifyBase {
  String get cliarifyGeneratedName;
  Map<String, Args> get cliarifyOptionGeneratedFields;

  String get cliarifyName => cliarifyGeneratedName;
  String? get cliarifyDescription => null;
  Map<String, Args> get cliarifyOptionFields => cliarifyOptionGeneratedFields;
  final List<String> cliarifyParentName = [];

  String cliarifyHelp({
    CliarifyColorPalette? config,
    bool commands = true,
    bool arguments = true,
    bool usage = true,
    bool flag = true,
  }) {
    final palette = config ?? CliarifyColorPalette();
    final help = CliarifyHelpPrinterMessage([...cliarifyParentName, cliarifyName], cliarifyOptionFields, config);
    final data = {
      if (commands) 'COMMANDS': help.commandsParse(),
      if (arguments) 'ARGUMENTS': help.argumentsParse(),
      if (usage) 'USAGE': help.usageParse(),
      if (flag) 'FLAG': help.flagParse(),
    };
    final filter = data.entries.where((e) => e.value != null);
    final line = [];
    if (cliarifyDescription != null) {
      line.add(cliarifyDescription!);
    }
    line.add(filter.map((e) => [palette.bold(e.key), e.value].join('\n')).join('\n\n'));
    return line.join('\n\n');
  }

  cliarifyRun();

  T? cliarifyParseArgs<T extends CliarifyBase>(List<String> args) {
    CliarifyParser.subCommandInit(fields: cliarifyOptionFields);
    final exclusive = CliarifyExclusiveParser.check(base: this, args: args, fields: cliarifyOptionFields);
    if (exclusive) {
      return null;
    } else {
      final parser = ArgParser();
      CliarifyParser.parserInit(parser: parser, fields: cliarifyOptionFields);
      final results = CliarifyParser.parse(parser: parser, args: args, fields: cliarifyOptionFields);
      final child = CliarifyParser.build(fields: cliarifyOptionFields, results: results);
      return (child == null) ? this as T : child as T;
    }
  }
}
