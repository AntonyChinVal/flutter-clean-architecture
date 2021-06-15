import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/presentation/core/ProviderScreen.dart';
import 'package:clean_project/src/domain/usecases/GetAppItemsUseCase.dart';
import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';

class AppItemListNotifier extends ScreenNotifier {
  List<AppItem> appItems = [];
  List<AppItem> originalAppItems = [];
  GetAppItemsUseCase? _getAppItemsUseCase;

  AppItemListNotifier() {
    this._getAppItemsUseCase = getIt<GetAppItemsUseCase>();
  }

  AppItemListNotifier.test(GetAppItemsUseCase getAppItemsUseCase) {
    this._getAppItemsUseCase = getAppItemsUseCase;
  }

  getAppItems() async {
    try {
      this.startLoading();
      List<AppItem> appItems = await this._getAppItemsUseCase!.execute();
      this.appItems = appItems;
      this.originalAppItems = appItems;
      this.finishLoading();
    } catch (_) {
      this.finishLoading();
    }
  }

  filterAppItems(String namePattern) async {
    try {
      var filterList = this
          .originalAppItems
          .where((item) => item.name!.contains(namePattern))
          .toList();
      this.appItems = filterList;
      notifyListeners();
    } catch (_) {}
  }
}
