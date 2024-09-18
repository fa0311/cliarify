import 'package:cliarify/base.dart';

abstract class Args<T> {
  final String? description;
  final bool hidden;

  late T value;

  Args({
    this.description,
    this.hidden = false,
  });
}

class SubCommand extends Args<CliarifyBase> {
  final CliarifyBase Function() builder;
  SubCommand({
    required this.builder,
    super.description,
    super.hidden,
  });
}

abstract class PositionalArgs<T> extends Args<T> {
  PositionalArgs({
    super.description,
  });
  T parse(String? input);
}

abstract class RestArgs<T> extends Args<List<T>> {
  RestArgs({
    super.description,
    super.hidden,
  });
  T parse(List<String>? input);
}

abstract class ArgsDescription<T> extends Args<T> {
  final List<String> aliases;
  final String? abbr;
  final void Function(CliarifyBase e)? exclusive;

  ArgsDescription({
    this.aliases = const [],
    this.abbr,
    super.description,
    super.hidden,
    this.exclusive,
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
