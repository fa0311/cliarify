String lowerCamelCaseToKebabCase(String input) {
  final exp = RegExp(
      r'(^[a-z][a-z0-9]+|[A-Z][a-z0-9]+|[A-Z][A-Z]+[0-9]*(?=([A-Z]|$)))');
  final res = exp.allMatches(input).map((match) => match.group(1)!);
  return res.join('-').toLowerCase();
}
