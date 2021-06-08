import 'dart:async';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/domain/repositories/AppItemRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAppItemsUseCase extends UseCaseN<List<AppItem>> {
  AppItemRepository? _appItemRepository;

  GetAppItemsUseCase.test();
  GetAppItemsUseCase(this._appItemRepository) : super();

  @override
  Future<List<AppItem>> execute() async {
    try {
      List<AppItem> items = await this._appItemRepository!.getAppItems();
      return items;
    } catch (ex) {
      return [];
    }
  }
}
