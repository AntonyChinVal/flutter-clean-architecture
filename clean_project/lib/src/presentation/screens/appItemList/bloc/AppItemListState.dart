import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';

abstract class AppItemListState extends ScreenBlocState {
  final List<AppItem> appItems;
  final List<AppItem> originalAppItems;
  AppItemListState(bool isLoading, this.appItems, this.originalAppItems)
      : super(isLoading);

  @override
  List<Object> get props => [appItems, originalAppItems];
}

class AppItemsListInitState extends AppItemListState {
  AppItemsListInitState() : super(false, [], []);
}

class AppItemsLoadingState extends AppItemListState {
  AppItemsLoadingState() : super(true, [], []);
}

class AppItemsLoadedState extends AppItemListState {
  AppItemsLoadedState(List<AppItem> appItems)
      : super(false, appItems, appItems);
}

class AppItemsFilterState extends AppItemListState {
  AppItemsFilterState(List<AppItem> filterAppItems, List<AppItem> appItems)
      : super(false, filterAppItems, appItems);
}
