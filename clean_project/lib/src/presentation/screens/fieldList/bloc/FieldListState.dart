import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';

abstract class FieldListState extends ScreenBlocState{
  final List<Field> fields;
  final List<Field> originalFields;
  FieldListState(bool isLoading, this.fields, this.originalFields) : super(isLoading);

  @override
  List<Object> get props => [fields,originalFields];
}

class FieldsListInitState extends FieldListState{
  FieldsListInitState()  : super(false, [], []);
}

class FieldsLoadingState extends FieldListState{
  FieldsLoadingState()  : super(true, [], []);
}

class FieldsLoadedState extends FieldListState{
  FieldsLoadedState(List<Field> fields)  : super(false,fields , fields);
}

class FieldsFilterState extends FieldListState{
  FieldsFilterState(List<Field> filterFields , List<Field> fields)  : super(false,filterFields, fields);
}