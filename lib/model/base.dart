abstract class Args<T> {
  final List<String> aliases;
  final String? abbr;
  final String? description;
  final bool hidden;

  late T value;

  Args({
    this.aliases = const [],
    this.abbr,
    this.description,
    this.hidden = false,
  });
}

abstract class ArgsDescription<T> extends Args<T> {
  ArgsDescription({
    super.aliases,
    super.abbr,
    super.description,
    super.hidden,
  });

  String? defaultDescription() => null;
  String? enumDescription() => null;
}

abstract class OptionArgs<T> extends ArgsDescription<T> {
  OptionArgs({
    super.aliases,
    super.abbr,
    super.description,
  });
  T parse(String? input);
}

abstract class FlagArgs<T> extends ArgsDescription<T> {
  final bool negatable;
  FlagArgs({
    this.negatable = false,
    super.aliases,
    super.abbr,
    super.description,
  });
  T parse(bool? input);
}

abstract class MultiOptionArgs<T> extends ArgsDescription<List<T>> {
  MultiOptionArgs({
    super.aliases,
    super.abbr,
    super.description,
  });
  T parse(List<String>? input);
}
