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

    final name = lowerCamelCaseToKebabCase(className);

    builder.declareInType(DeclarationCode.fromString('''
  @override
  get cliarifyGeneratedName => "$name";
  @override
  get cliarifyOptionGeneratedFields => {
$fieldsMap
  };

  $className? cliarifyParseArgs(List<String> args){
    return super.cliarifyParseArgs(args);
  }
'''));
  }
}
