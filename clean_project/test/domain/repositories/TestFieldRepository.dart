import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/repositories/FieldRepository.dart';

class TestFieldRepository extends FieldRepository {
  @override
  Future<List<Field>> getFields() {
    return Future.delayed(
      Duration(seconds: 1),
      () => [],
    );
  }
}
