import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/presentation/screens/appItemList/bloc/AppItemListEvent.dart';
import 'package:clean_project/src/presentation/screens/appItemList/bloc/AppItemListState.dart';
import 'package:clean_project/src/domain/usecases/GetAppItemsUseCase.dart';
import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';

class AppItemListBloc extends ScreenBloc<AppItemListEvent, AppItemListState> {
  GetAppItemsUseCase? _getAppItemsUseCase;

  AppItemListBloc() : super(AppItemsListInitState()) {
    this._getAppItemsUseCase = getIt<GetAppItemsUseCase>();
  }

  AppItemListBloc.test(GetAppItemsUseCase getAppItemsUseCase)
      : super(AppItemsListInitState()) {
    this._getAppItemsUseCase = getAppItemsUseCase;
  }

  @override
  Stream<AppItemListState> mapEventToState(AppItemListEvent event) async* {
    if (event is GetAppItemListEvent) {
      yield* _getAppItems(event);
    } else if (event is FilterAppItemsEvent) {
      yield* _filterAppItems(event);
    }
  }

  Stream<AppItemListState> _getAppItems(GetAppItemListEvent event) async* {
    try {
      yield AppItemsLoadingState();
      List<AppItem> appItems = await this._getAppItemsUseCase!.execute();
      yield AppItemsLoadedState(appItems);
    } catch (_) {
      yield AppItemsListInitState();
    }
  }

  Stream<AppItemListState> _filterAppItems(FilterAppItemsEvent event) async* {
    try {
      yield AppItemsLoadingState();
      final filterList = this
          .state
          .originalAppItems
          .where((item) => item.name!.contains(event.namePattern))
          .toList();
      yield AppItemsFilterState(filterList, this.state.originalAppItems);
    } catch (_) {
      yield AppItemsListInitState();
    }
  }
}
