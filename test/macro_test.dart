import 'package:cliarify/macro/util.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('lowerCamelCaseToKebabCase', () {
    final res = lowerCamelCaseToKebabCase('toJson');
    expect(res, 'to-json');

    final res2 = lowerCamelCaseToKebabCase('toJSON');
    expect(res2, 'to-json');

    final res3 = lowerCamelCaseToKebabCase('toJSON2');
    expect(res3, 'to-json2');

    final res4 = lowerCamelCaseToKebabCase('toJSONString');
    expect(res4, 'to-json-string');

    final res5 = lowerCamelCaseToKebabCase('toJSONString2');
    expect(res5, 'to-json-string2');

    final res6 = lowerCamelCaseToKebabCase('toJSONString2String');
    expect(res6, 'to-json-string2-string');

    final res7 = lowerCamelCaseToKebabCase('JSON2YAML');
    expect(res7, 'json2-yaml');

    final res8 = lowerCamelCaseToKebabCase('JSON2Yaml');
    expect(res8, 'json2-yaml');
  });
}
