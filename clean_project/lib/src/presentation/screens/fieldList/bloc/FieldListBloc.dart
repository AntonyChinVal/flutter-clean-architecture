import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListEvent.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListState.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/usecases/GetFieldsUseCase.dart';
import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';

class FieldListBloc extends ScreenBloc<FieldListEvent, FieldListState> {
  final GetFieldsUseCase _getFieldsUseCase = getIt<GetFieldsUseCase>();

  FieldListBloc() : super(FieldsListInitState());

  @override
  Stream<FieldListState> mapEventToState(FieldListEvent event) async* {
    if (event is GetFieldListEvent) {
      yield* _getFields(event);
    } else if (event is FilterFieldsEvent) {
      yield* _filterFields(event);
    }
  }

  Stream<FieldListState> _getFields(GetFieldListEvent event) async* {
    try {
      yield FieldsLoadingState();
      List<Field> fields = await this._getFieldsUseCase.execute();
      yield FieldsLoadedState(fields);
    } catch (_) {
      yield FieldsListInitState();
    }
  }

  Stream<FieldListState> _filterFields(FilterFieldsEvent event) async* {
    try {
      yield FieldsLoadingState();
      final filterList = this
          .state
          .originalFields
          .where((item) => item.name!.contains(event.namePattern))
          .toList();
      yield FieldsFilterState(filterList, this.state.originalFields);
    } catch (_) {
      yield FieldsListInitState();
    }
  }
}
