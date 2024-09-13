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
  String get missingErrorTitle => 'Error: Missing required argument:';
  String get notFoundErrorTitle => 'Error: Could not find an option named:';
  String get unknownCommandErrorTitle => 'Error: Unknown command:';
  String get unknownPositionalErrorTitle => 'Error: Unknown positional argument:';

  String missingError(CliarifyMissingArgumentException data) {
    return indent([
      "$missingErrorTitle${(data.description == null ? ' ${data.name}' : '')}",
      if (data.description != null) "${data.name}  ${data.description}",
      seeMoreHelp,
    ]);
  }

  CliarifyErrorPrinterMessage([CliarifyColorPalette? config]) : config = CliarifyColorPalette();
}

abstract class CliarifyException implements Exception {
  final String name;
  final String? message;
  final String? description;

  CliarifyException({
    required this.name,
    this.message,
    this.description,
  });

  String printError([CliarifyErrorPrinterMessage? config]);
}

class CliarifyMissingArgumentException extends CliarifyException {
  CliarifyMissingArgumentException({
    required super.name,
    super.message,
    super.description,
  });

  @override
  String printError([CliarifyErrorPrinterMessage? config]) {
    final conf = config ?? CliarifyErrorPrinterMessage();
    return conf.missingError(this);
  }
}
