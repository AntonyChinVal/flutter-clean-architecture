import 'package:data/api/api_service.dart';
import 'package:domain/model/generic_item/generic_item.dart';
import 'package:domain/repositories/generic_item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  ApiService? _apiService;

  ItemRepositoryImpl(ApiService apiService) {
    this._apiService = apiService;
  }

  @override
  Future<List<GenericItem>> getItems() {
    return _apiService!.get<List>("field/list").then((response) {
      List<GenericItem>? list = response
          .map((e) => GenericItem.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    }).catchError((error) {
      throw error;
    });
  }
}
