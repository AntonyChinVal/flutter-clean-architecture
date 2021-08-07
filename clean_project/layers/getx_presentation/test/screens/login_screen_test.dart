import 'package:domain/model/generic_user/generic_user.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_presentation/screens/login/login_controller.dart';
import 'package:getx_presentation/screens/login/login_screen.dart';
import '../test_material_app.dart';
import 'package:get/get.dart';

class UserRepositoryTest extends UserRepository {
  @override
  Future authenticate({String email = "", String password = ""}) async {}

  @override
  Future<GenericUser> getUser() async {
    return GenericUser();
  }
}

void main() {
  loginBlocTest();
}

void loginBlocTest() {
  group('LoginController', () {
    late LoginController controller;

    setUp(() {
      Get.testMode = true;
      controller =
          LoginController(loginUseCase: LoginUseCase(UserRepositoryTest()));
    });

    test('login', () async {
      GenericUser? user = await controller.authenticate();
      expect(user is GenericUser?, true);
    });

    Widget _wrapScreen(GetXLoginScreen loginScreen) {
      return TestMaterialAppWidget(
        home: loginScreen,
      );
    }

    testWidgets("LoginScreen built", (WidgetTester tester) async {
      //  given
      final widget = GetXLoginScreen(controller);

      //  when
      await tester.pumpWidget(_wrapScreen(widget));
      widget.login("email", "password");

      //  then
      expect(find.byType(GetXLoginScreen), findsOneWidget);
    });
  });
}
