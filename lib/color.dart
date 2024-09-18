class CliarifyColorPalette {
  String prefix(int code) => '\u001B[${code}m';
  String noColor(String text) => text.replaceAll(RegExp(r'\u001B\[\d+m'), '');

  String format(int open, int close, String text) {
    return '${prefix(open)}$text${prefix(close)}';
  }

  String reset(String text) => format(0, 0, text);
  String bold(String text) => format(1, 22, text);
  String dim(String text) => format(2, 22, text);
  String italic(String text) => format(3, 23, text);
  String underline(String text) => format(4, 24, text);
  String overline(String text) => format(53, 55, text);
  String inverse(String text) => format(7, 27, text);
  String hidden(String text) => format(8, 28, text);
  String strikethrough(String text) => format(9, 29, text);

  String black(String text) => format(30, 39, text);
  String red(String text) => format(31, 39, text);
  String green(String text) => format(32, 39, text);
  String yellow(String text) => format(33, 39, text);
  String blue(String text) => format(34, 39, text);
  String magenta(String text) => format(35, 39, text);
  String cyan(String text) => format(36, 39, text);
  String white(String text) => format(37, 39, text);
  String gray(String text) => format(90, 39, text);

  String bgBlack(String text) => format(40, 49, text);
  String bgRed(String text) => format(41, 49, text);
  String bgGreen(String text) => format(42, 49, text);
  String bgYellow(String text) => format(43, 49, text);
  String bgBlue(String text) => format(44, 49, text);
  String bgMagenta(String text) => format(45, 49, text);
  String bgCyan(String text) => format(46, 49, text);
  String bgWhite(String text) => format(47, 49, text);
  String bgGray(String text) => format(100, 49, text);

  String redBright(String text) => format(91, 39, text);
  String greenBright(String text) => format(92, 39, text);
  String yellowBright(String text) => format(93, 39, text);
  String blueBright(String text) => format(94, 39, text);
  String magentaBright(String text) => format(95, 39, text);
  String cyanBright(String text) => format(96, 39, text);
  String whiteBright(String text) => format(97, 39, text);

  String bgRedBright(String text) => format(101, 49, text);
  String bgGreenBright(String text) => format(102, 49, text);
  String bgYellowBright(String text) => format(103, 49, text);
  String bgBlueBright(String text) => format(104, 49, text);
  String bgMagentaBright(String text) => format(105, 49, text);
  String bgCyanBright(String text) => format(106, 49, text);
  String bgWhiteBright(String text) => format(107, 49, text);
}
