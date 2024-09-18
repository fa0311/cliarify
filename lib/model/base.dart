import 'package:cliarify/base.dart';

abstract class Args<T> {
  final List<String> aliases;
  final String? abbr;
  final String? description;
  final bool hidden;
  final void Function(CliarifyBase e)? exclusive;

  late T value;

  Args({
    this.aliases = const [],
    this.abbr,
    this.description,
    this.hidden = false,
    this.exclusive,
  });
}

abstract class ArgsDescription<T> extends Args<T> {
  ArgsDescription({
    super.aliases,
    super.abbr,
    super.description,
    super.hidden,
    super.exclusive,
  });

  String? defaultDescription() => null;
  List<String>? enumDescription() => null;
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
    super.exclusive,
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
