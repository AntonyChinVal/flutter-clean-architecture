import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/domain/repositories/AppItemRepository.dart';

class TestAppItemRepository extends AppItemRepository {
  @override
  Future<List<AppItem>> getAppItems() {
    return Future.delayed(
      Duration(seconds: 1),
      () => [],
    );
  }
}
