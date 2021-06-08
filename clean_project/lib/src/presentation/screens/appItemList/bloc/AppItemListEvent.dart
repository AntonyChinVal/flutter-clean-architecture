abstract class AppItemListEvent {}

class GetAppItemListEvent extends AppItemListEvent {
  GetAppItemListEvent();
}

class FilterAppItemsEvent extends AppItemListEvent {
  final String namePattern;
  FilterAppItemsEvent(this.namePattern);
}
