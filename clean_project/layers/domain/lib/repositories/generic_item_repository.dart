import 'package:domain/model/generic_item/generic_item.dart';

abstract class ItemRepository {
  Future<List<GenericItem>> getItems();
}
