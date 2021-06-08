import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';

abstract class AppItemRepository {
  Future<List<AppItem>> getAppItems();
}
