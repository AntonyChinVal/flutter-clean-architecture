import 'dart:async';
import 'package:domain/core/use_case.dart';
import 'package:domain/model/generic_item/generic_item.dart';
import 'package:domain/repositories/generic_item_repository.dart';

class GetItemsUseCase extends NoParamUseCase<List<GenericItem>> {
  ItemRepository? _itemRepository;

  GetItemsUseCase(this._itemRepository) : super();

  @override
  Future<List<GenericItem>> execute() async {
    try {
      List<GenericItem> items = await this._itemRepository!.getItems();
      return items;
    } catch (ex) {
      return [];
    }
  }
}
