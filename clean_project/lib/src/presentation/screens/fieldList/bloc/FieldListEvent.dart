abstract class FieldListEvent{}

class GetFieldListEvent extends FieldListEvent {
  GetFieldListEvent();
}

class FilterFieldsEvent extends FieldListEvent {
  final String namePattern;
  FilterFieldsEvent( this.namePattern);
}