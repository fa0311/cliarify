import 'package:cliarify/color.dart';

class CliarifyErrorPrinterMessage {
  final CliarifyColorPalette config;
  static T pluralize<T>(int len, T singular, T plural) {
    return len == 1 ? singular : plural;
  }

  String indent(List<String> text) {
    return text.map((e) => ' ${config.red("»")}   $e').join('\n');
  }

  String get seeMoreHelp => 'See more help with --help';
  String get missingArgumentError => 'Error: Missing required argument:';
  String get optionNotFoundError => 'Error: Option not found:';
  String get unknownCommandError => 'Error: Unknown command:';
  String get unknownPositionalArgumentError => 'Error: Unknown positional argument:';
  String get requiredArgumentMissingError => 'Error: Required argument is missing:';
  String get stringTooShortError => 'Error: String is too short:';
  String get stringTooLongError => 'Error: String is too long:';
  String get stringPatternMismatchError => 'Error: String does not match the pattern:';
  String get emptyStringNotAllowedError => 'Error: Empty string is not allowed:';
  String get invalidNumberError => 'Error: Not a valid number:';
  String get numberTooSmallError => 'Error: Number is too small:';
  String get numberTooLargeError => 'Error: Number is too big:';
  String get dateTooEarlyError => 'Error: Date is too early:';
  String get dateTooLateError => 'Error: Date is too late:';
  String get invalidDateError => 'Error: Not a valid date:';
  String get invalidDurationError => 'Error: Not a valid duration:';
  String get durationTooShortError => 'Error: Duration is too short:';
  String get durationTooLongError => 'Error: Duration is too long:';
  String get uriSchemeNotAllowedError => 'Error: URI scheme is not allowed:';
  String get relativeUriNotAllowedError => 'Error: Relative URI is not allowed:';
  String get invalidUriError => 'Error: Not a valid URI:';
  String get invalidEnumValueError => 'Error: Not a valid enum value:';

  String error(String message, CliarifyException data) {
    final line = <String>[];
    line.add("$message ${data.name}");
    if (data.description != null) {
      line.add("${data.description}");
    }
    line.add(seeMoreHelp);
    return indent(line);
  }

  CliarifyErrorPrinterMessage([CliarifyColorPalette? config]) : config = CliarifyColorPalette();
}

class CliarifyException {
  final String name;
  final String Function(CliarifyErrorPrinterMessage) title;
  final String? description;

  CliarifyException({
    required this.name,
    required this.title,
    this.description,
  });

  String printError([CliarifyErrorPrinterMessage? config]) {
    final conf = config ?? CliarifyErrorPrinterMessage();
    return conf.error(title(conf), this);
  }
}
