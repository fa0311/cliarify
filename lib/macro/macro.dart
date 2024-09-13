import 'dart:async';

import 'package:cliarify/macro/util.dart';
import 'package:macros/macros.dart';



macro class Cliarify implements ClassDeclarationsMacro {
  const Cliarify();

  @override
  Future<void> buildDeclarationsForClass(
    ClassDeclaration classDeclaration,
    MemberDeclarationBuilder builder,
  ) async {
    final fields = await builder.fieldsOf(classDeclaration);
    final className = classDeclaration.identifier.name;

    final fieldNames = fields.map((e) {
      return MapEntry(
        lowerCamelCaseToKebabCase(e.identifier.name),
        e.identifier.name,
      );
    });
    final fieldsMap = fieldNames.map((e) {
      return '      "${e.key}": ${e.value}';
    }).join(',\n');

    builder.declareInType(DeclarationCode.fromString('''
  get cliarifyOptionFields => {
$fieldsMap
  };
  $className cliarifyParseArgs(List<String> args){
    return super.cliarifyParseArgs(args);
  }
'''));
  }
}
