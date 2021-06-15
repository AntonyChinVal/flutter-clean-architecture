import 'package:clean_project/src/presentation/screens/main/MainTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_material_app.dart';

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

    testWidgets("MainTemplate built", (WidgetTester tester) async {
      //  given
      final widget = MainTemplate(
        onTapHandler: (index) {},
        selectedIndex: 0,
        widgets: null,
      );

      //  when
      await tester.pumpWidget(_wrapTemplate(widget));

      //  then
      expect(find.byType(MainTemplate), findsOneWidget);
    });
  });
}
