import 'package:clean_project/src/presentation/components/templates/LoginTemplate.dart';
import 'package:clean_project/src/presentation/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_material_app.dart';

void main() {
  loginScreenTest();
}

void loginScreenTest() {
  Widget _wrapTemplate(LoginTemplate loginTemplate) {
    return TestMaterialAppWidget(
      home: loginTemplate,
    );
  }

  Widget _wrapScreen(LoginScreen loginScreen) {
    return TestMaterialAppWidget(
      home: loginScreen,
    );
  }

  testWidgets("LoginTemplate built", (WidgetTester tester) async {
    //  given
    final widget = LoginTemplate(
      onLogin: (email, password) {},
      onFacebookLogin: () {},
      onForgetPassword: () {},
      onGoogleLogin: () {},
    );

    //  when
    await tester.pumpWidget(_wrapTemplate(widget));

    //  then
    expect(find.byType(LoginTemplate), findsOneWidget);
  });

  testWidgets("LoginScreen built", (WidgetTester tester) async {
    //  given
    final widget = LoginScreen();

    //  when
    await tester.pumpWidget(_wrapScreen(widget));

    //  then
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
