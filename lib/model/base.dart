abstract class Args<T> {
  final List<String> aliases;
  final String? abbr;
  late T value;

  Args({
    this.aliases = const [],
    this.abbr,
  });

  String getHelp();
}

abstract class OptionArgs<T> extends Args<T> {
  OptionArgs({
    super.aliases,
    super.abbr,
  });

  T parse(String? input);
}

abstract class FlagArgs<T> extends Args<T> {
  final bool negatable;

  FlagArgs({
    this.negatable = false,
    super.aliases,
    super.abbr,
  });
  T parse(bool? input);
}

abstract class MultiOptionArgs<T> extends Args<List<T>> {
  MultiOptionArgs({
    super.aliases,
    super.abbr,
  });
  T parse(List<String>? input);
}
