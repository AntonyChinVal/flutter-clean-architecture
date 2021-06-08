import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/domain/usecases/GetAppItemsUseCase.dart';
import 'package:flutter_test/flutter_test.dart';
import '../repositories/TestAppItemRepository.dart';

void main() {
  getAppItemsUseCaseTest();
}

void getAppItemsUseCaseTest() {
  group("Get Fields UseCase", () {
    GetAppItemsUseCase getFieldsUseCaseSuccess =
        GetAppItemsUseCase(TestAppItemRepository());
    test('Get Fields UseCase Success', () async {
      List<AppItem> fields = await getFieldsUseCaseSuccess.execute();
      expect(fields.isEmpty, true);
    });
  });
}
