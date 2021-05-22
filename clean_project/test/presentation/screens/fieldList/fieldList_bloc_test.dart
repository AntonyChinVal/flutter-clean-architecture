import 'package:bloc_test/bloc_test.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/domain/usecases/GetFieldsUseCase.dart';
import 'package:clean_project/src/presentation/components/templates/FieldListTemplate.dart';
import 'package:clean_project/src/presentation/screens/fieldList/FieldListScreen.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListBloc.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListEvent.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_material_app.dart';

class GetFieldsUseCaseTest extends GetFieldsUseCase {
  GetFieldsUseCaseTest.test() : super.test();
  @override
  Future<List<Field>> execute() async {
    return [];
  }
}

class TestFieldListScreen extends FieldListScreen {
  @override
  FieldListScreenState createState() => FieldListScreenState.test(
      FieldListBloc.test(GetFieldsUseCaseTest.test()));
}

void main() {
  fieldListBlocTest();
}

void fieldListBlocTest() {
  group('FieldListBloc', () {
    late FieldListBloc fieldListBloc;

    setUp(() {
      fieldListBloc = FieldListBloc.test(GetFieldsUseCaseTest.test());
    });

    test('Initial FieldList Bloc', () {
      expect(fieldListBloc.state, FieldsListInitState());
    });

    blocTest(
      'FieldList get fields',
      build: () => fieldListBloc,
      act: (FieldListBloc bloc) => bloc.add(GetFieldListEvent()),
      expect: () => [FieldsLoadingState(), FieldsLoadedState([])],
    );
    blocTest(
      'FieldList filter fields',
      build: () => fieldListBloc,
      act: (FieldListBloc bloc) => bloc.add(FilterFieldsEvent("")),
      expect: () => [FieldsLoadingState(), FieldsFilterState([], [])],
    );

    Widget _wrapTemplate(FieldListTemplate fieldListTemplate) {
      return TestMaterialAppWidget(
        home: fieldListTemplate,
      );
    }

    Widget _wrapScreen(FieldListScreen fieldListScreen) {
      return TestMaterialAppWidget(
        home: fieldListScreen,
      );
    }

    testWidgets("FieldListTemplate built", (WidgetTester tester) async {
      //  given
      final widget = FieldListTemplate(
        fields: [Field(name: "Field1"), Field(name: "Field2")],
        searchController: TextEditingController(),
      );

      //  when
      await tester.pumpWidget(_wrapTemplate(widget));

      //  then
      expect(find.byType(FieldListTemplate), findsOneWidget);
    });
    testWidgets("FieldListScreen built", (WidgetTester tester) async {
      //  given
      final widget = TestFieldListScreen();
      widget.getIcon();
      widget.getName();
      FieldListScreenState state = widget.createState();
      state.getFields();
      //  when
      await tester.pumpWidget(_wrapScreen(widget));

      //  then
      expect(find.byType(TestFieldListScreen), findsOneWidget);
    });
  });
}
