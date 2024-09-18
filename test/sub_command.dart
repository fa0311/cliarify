import 'package:cliarify/base.dart';
import 'package:cliarify/macro/macro.dart';
import 'package:cliarify/model/base.dart';
import 'package:cliarify/model/flag.dart';
import 'package:cliarify/model/option.dart';
import 'package:cliarify/model/positional.dart';
import 'package:test/test.dart';

@Cliarify()
class Add extends CliarifyBase {
  @override
  get cliarifyDescription => 'Add file contents to the index';

  final all = BoolFlag(abbr: 'a', negatable: false);
  final patch = BoolFlag(abbr: 'p', negatable: false);
  final help = BoolFlag(
    abbr: 'h',
    exclusive: (e) => print(e.cliarifyHelp()),
  );

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

@Cliarify()
class Commit extends CliarifyBase {
  @override
  get cliarifyDescription => 'Record changes to the repository';

  final message = StringOption(
    abbr: 'm',
    description: 'Use the given <msg> as the commit message',
  );

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

@Cliarify()
class Clone extends CliarifyBase {
  @override
  get cliarifyDescription => 'Clone a repository into a new directory';
  final repository = StringPositional();
  final help = BoolFlag(
    abbr: 'h',
    exclusive: (e) => print(e.cliarifyHelp()),
  );

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

@Cliarify()
class GitLike extends CliarifyBase {
  @override
  get cliarifyDescription => 'A git-like command';
  final add = SubCommand(builder: () => Add());
  final commit = SubCommand(builder: () => Commit());
  final clone = SubCommand(builder: () => Clone());
  final help = BoolFlag(
    abbr: 'h',
    exclusive: (e) => print(e.cliarifyHelp()),
  );

  @override
  cliarifyRun() {
    throw UnimplementedError();
  }
}

void main() {
  test('Command Help', () {
    GitLike().cliarifyParseArgs(['-h']);
    GitLike().cliarifyParseArgs(['add', '-h']);
    GitLike().cliarifyParseArgs(['clone', '-h']);
    GitLike().cliarifyParseArgs(['clone', 'aaaaaaa']);
  });

  test('Sub Command', () {
    final res = GitLike().cliarifyParseArgs<Clone>(['clone', 'aaaaaaa'])!;
    expect(res.repository.value, 'aaaaaaa');
  });
}
