import 'package:clean_project/src/presentation/screens/main/MainScreen.dart';
import 'package:clean_project/src/presentation/screens/main/MainTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_material_app.dart';

class TestMainScreen extends MainScreen {
  @override
  MainScreenState createState() => MainScreenState.test();
}

void main() {
  mainBlocTest();
}

void mainBlocTest() {
  group('MainScreen', () {
    Widget _wrapTemplate(MainTemplate template) {
      return TestMaterialAppWidget(
        home: template,
      );
    }

    Widget _wrapScreen(MainScreen screen) {
      return TestMaterialAppWidget(
        home: screen,
      );
    }

    testWidgets("MainTemplate built", (WidgetTester tester) async {
      //  given
      final widget = MainTemplate(
        onTapHandler: (index) {},
        selectedIndex: 0,
        widgets: [],
      );

      //  when
      await tester.pumpWidget(_wrapTemplate(widget));

      //  then
      expect(find.byType(MainTemplate), findsOneWidget);
    });

    testWidgets("UserScreen built", (WidgetTester tester) async {
      //  given
      final widget = TestMainScreen();
      widget.getIcon();
      widget.getName();
      //  when
      await tester.pumpWidget(_wrapScreen(widget));

      //  then
      expect(find.byType(TestMainScreen), findsOneWidget);
    });
  });
}
