class CliarifyColorPalette {
  static String prefix(int code) => '\u001B[${code}m';
  static String format(int open, int close, String text) {
    return '${prefix(open)}$text${prefix(close)}';
  }

  String reset(text) => format(0, 0, text);
  String bold(text) => format(1, 22, text);
  String dim(text) => format(2, 22, text);
  String italic(text) => format(3, 23, text);
  String underline(text) => format(4, 24, text);
  String overline(text) => format(53, 55, text);
  String inverse(text) => format(7, 27, text);
  String hidden(text) => format(8, 28, text);
  String strikethrough(text) => format(9, 29, text);

  String black(text) => format(30, 39, text);
  String red(text) => format(31, 39, text);
  String green(text) => format(32, 39, text);
  String yellow(text) => format(33, 39, text);
  String blue(text) => format(34, 39, text);
  String magenta(text) => format(35, 39, text);
  String cyan(text) => format(36, 39, text);
  String white(text) => format(37, 39, text);
  String gray(text) => format(90, 39, text);

  String bgBlack(text) => format(40, 49, text);
  String bgRed(text) => format(41, 49, text);
  String bgGreen(text) => format(42, 49, text);
  String bgYellow(text) => format(43, 49, text);
  String bgBlue(text) => format(44, 49, text);
  String bgMagenta(text) => format(45, 49, text);
  String bgCyan(text) => format(46, 49, text);
  String bgWhite(text) => format(47, 49, text);
  String bgGray(text) => format(100, 49, text);

  String redBright(text) => format(91, 39, text);
  String greenBright(text) => format(92, 39, text);
  String yellowBright(text) => format(93, 39, text);
  String blueBright(text) => format(94, 39, text);
  String magentaBright(text) => format(95, 39, text);
  String cyanBright(text) => format(96, 39, text);
  String whiteBright(text) => format(97, 39, text);

  String bgRedBright(text) => format(101, 49, text);
  String bgGreenBright(text) => format(102, 49, text);
  String bgYellowBright(text) => format(103, 49, text);
  String bgBlueBright(text) => format(104, 49, text);
  String bgMagentaBright(text) => format(105, 49, text);
  String bgCyanBright(text) => format(106, 49, text);
  String bgWhiteBright(text) => format(107, 49, text);
}
