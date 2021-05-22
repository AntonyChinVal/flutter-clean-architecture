import 'dart:async';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/repositories/FieldRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFieldsUseCase extends UseCaseN<List<Field>> {
  FieldRepository? _fieldRepository;

  GetFieldsUseCase.test();
  GetFieldsUseCase(this._fieldRepository) : super();

  @override
  Future<List<Field>> execute() async {
    try {
      List<Field> fields = await this._fieldRepository!.getFields();
      return fields;
    } catch (ex) {
      return [];
    }
  }
}
