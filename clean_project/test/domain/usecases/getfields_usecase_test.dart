import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/usecases/GetFieldsUseCase.dart';
import 'package:flutter_test/flutter_test.dart';
import '../repositories/TestFieldRepository.dart';

void main() {
  getFieldsUseCaseTest();
}

void getFieldsUseCaseTest() {
  group("Get Fields UseCase", () {
    GetFieldsUseCase getFieldsUseCaseSuccess =
        GetFieldsUseCase(TestFieldRepository());
    test('Get Fields UseCase Success', () async {
      List<Field> fields = await getFieldsUseCaseSuccess.execute();
      expect(fields.isEmpty, true);
    });
  });
}
