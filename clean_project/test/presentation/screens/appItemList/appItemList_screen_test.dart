import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/domain/usecases/GetAppItemsUseCase.dart';
import 'package:clean_project/src/presentation/screens/appItemList/AppItemListNotifier.dart';
import 'package:clean_project/src/presentation/screens/appItemList/AppItemListScreen.dart';
import 'package:clean_project/src/presentation/screens/appItemList/AppItemListTemplate.dart';
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
      AppItemListNotifier.test(GetAppItemsUseCaseTest.test()));
}

void main() {
  appitemListBlocTest();
}

void appitemListBlocTest() {
  group('AppItemListBloc', () {
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
