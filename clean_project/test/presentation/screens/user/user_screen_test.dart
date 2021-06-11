import 'package:clean_project/src/presentation/screens/user/UserScreen.dart';
import 'package:clean_project/src/presentation/screens/user/UserTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_material_app.dart';

void main() {
  userScreenTest();
}

void userScreenTest() {
  Widget _wrapTemplate(UserTemplate template) {
    return TestMaterialAppWidget(
      home: template,
    );
  }

  Widget _wrapScreen(UserScreen screen) {
    return TestMaterialAppWidget(
      home: screen,
    );
  }

  testWidgets("UserTemplate built", (WidgetTester tester) async {
    //  given
    final widget = UserTemplate();

    //  when
    await tester.pumpWidget(_wrapTemplate(widget));

    //  then
    expect(find.byType(UserTemplate), findsOneWidget);
  });

  testWidgets("UserScreen built", (WidgetTester tester) async {
    //  given
    final widget = UserScreen();
    widget.getIcon();
    widget.getName();
    //  when
    await tester.pumpWidget(_wrapScreen(widget));

    //  then
    expect(find.byType(UserScreen), findsOneWidget);
  });
}
