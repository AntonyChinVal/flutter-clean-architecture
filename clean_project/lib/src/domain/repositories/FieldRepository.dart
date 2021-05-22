import 'package:clean_project/src/domain/entities/field/Field.dart';

abstract class FieldRepository {
  Future<List<Field>> getFields();
}
