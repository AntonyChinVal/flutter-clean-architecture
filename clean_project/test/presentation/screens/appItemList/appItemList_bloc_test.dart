import 'package:bloc_test/bloc_test.dart';
import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/domain/usecases/GetAppItemsUseCase.dart';
import 'package:clean_project/src/presentation/components/templates/AppItemListTemplate.dart';
import 'package:clean_project/src/presentation/screens/appItemList/AppItemListScreen.dart';
import 'package:clean_project/src/presentation/screens/appItemList/bloc/AppItemListBloc.dart';
import 'package:clean_project/src/presentation/screens/appItemList/bloc/AppItemListEvent.dart';
import 'package:clean_project/src/presentation/screens/appItemList/bloc/AppItemListState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_material_app.dart';

class GetAppItemsUseCaseTest extends GetAppItemsUseCase {
  GetAppItemsUseCaseTest.test() : super.test();
  @override
  Future<List<AppItem>> execute() async {
    return [];
  }
}

class TestAppItemListScreen extends AppItemListScreen {
  @override
  AppItemListScreenState createState() => AppItemListScreenState.test(
      AppItemListBloc.test(GetAppItemsUseCaseTest.test()));
}

void main() {
  appitemListBlocTest();
}

void appitemListBlocTest() {
  group('AppItemListBloc', () {
    late AppItemListBloc appitemListBloc;

    setUp(() {
      appitemListBloc = AppItemListBloc.test(GetAppItemsUseCaseTest.test());
    });

    test('Initial AppItemList Bloc', () {
      expect(appitemListBloc.state, AppItemsListInitState());
    });

    blocTest(
      'AppItemList get appitems',
      build: () => appitemListBloc,
      act: (AppItemListBloc bloc) => bloc.add(GetAppItemListEvent()),
      expect: () => [AppItemsLoadingState(), AppItemsLoadedState([])],
    );
    blocTest(
      'AppItemList filter appitems',
      build: () => appitemListBloc,
      act: (AppItemListBloc bloc) => bloc.add(FilterAppItemsEvent("")),
      expect: () => [AppItemsLoadingState(), AppItemsFilterState([], [])],
    );

    Widget _wrapTemplate(AppItemListTemplate appitemListTemplate) {
      return TestMaterialAppWidget(
        home: appitemListTemplate,
      );
    }

    Widget _wrapScreen(AppItemListScreen appitemListScreen) {
      return TestMaterialAppWidget(
        home: appitemListScreen,
      );
    }

    testWidgets("AppItemListTemplate built", (WidgetTester tester) async {
      //  given
      final widget = AppItemListTemplate(
        items: [AppItem(name: "AppItem1"), AppItem(name: "AppItem2")],
        searchController: TextEditingController(),
      );

      //  when
      await tester.pumpWidget(_wrapTemplate(widget));

      //  then
      expect(find.byType(AppItemListTemplate), findsOneWidget);
    });
    testWidgets("AppItemListScreen built", (WidgetTester tester) async {
      //  given
      final widget = TestAppItemListScreen();
      widget.getIcon();
      widget.getName();
      AppItemListScreenState state = widget.createState();
      state.getAppItems();
      //  when
      await tester.pumpWidget(_wrapScreen(widget));

      //  then
      expect(find.byType(TestAppItemListScreen), findsOneWidget);
    });
  });
}
