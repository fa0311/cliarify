import 'package:cliarify/color.dart';
import 'package:cliarify/model/base.dart';
import 'package:cliarify/util.dart';

class CliarifyHelpPrinterMessage {
  final CliarifyColorPalette config;
  final Map<String, Args> fields;
  final String name;
  CliarifyHelpPrinterMessage(this.name, this.fields, [CliarifyColorPalette? config]) : config = CliarifyColorPalette();

  String usageParse() {
    final line = <String>[];
    line.add(' \$ $name ');

    for (final (key, value) in fields.tuple) {
      if (!value.hidden) {
        if (value is ArgsDescription) {
          final text = <String>[];
          final enumDescription = value.enumDescription();
          final options = enumDescription == null ? '' : enumDescription.join('|');

          if (enumDescription != null && options.length < 40) {
            text.add('--$key');
            text.add(options);
          } else if (value is OptionArgs) {
            text.add('--$key');
            text.add('<value>');
          } else {
            text.add('--$key');
          }
          line.add("[${text.join(' ')}]");
        }
      }
    }

    return line.join('');
  }

  String flagParse() {
    final table = <List<String>>[];
    for (final (key, value) in fields.tuple) {
      if (!value.hidden) {
        if (value is ArgsDescription) {
          final defaultDescription = value.defaultDescription();
          final enumDescription = value.enumDescription();
          final line = <String>[];

          line.add(value.abbr == null ? '' : '-${value.abbr}, ');

          if (value is FlagArgs && value.negatable) {
            line.add('--$key');
          } else if (enumDescription != null) {
            line.add('--$key=${config.underline("<options>")}  ');
          } else if (value is OptionArgs) {
            line.add('--$key=${config.underline("<value>")}  ');
          } else {
            line.add('--$key  ');
          }
          if (value is FlagArgs) {
            line.add('');
          } else {
            line.add(defaultDescription == null ? '' : '[default: $defaultDescription]  ');
          }
          line.add(enumDescription == null ? '' : '<options: ${enumDescription.join("|")}>  ');
          line.add(value.description ?? '');

          table.add(line);
        }
      }
    }
    final noColorTable = table.map((row) => row.map((e) => config.noColor(e)).toList()).toList();
    final maxLength = List.generate(table.first.length, (e) {
      return noColorTable.map((row) => row[e].length).reduce((a, b) => a > b ? a : b);
    });

    final res = (table, noColorTable).map((row, noColor) {
      return (row, noColor, maxLength).map((value, noColor, maxLength) {
        final space = ' ' * (maxLength - noColor.length);
        return '$value$space';
      }).join('');
    }).toList();
    return res.join('\n');
  }
}
