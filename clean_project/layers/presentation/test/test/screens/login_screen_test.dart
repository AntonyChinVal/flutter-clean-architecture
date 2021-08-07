import 'package:domain/model/generic_user/generic_user.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/screens/login/login_provider.dart';
import 'package:presentation/screens/login/login_screen.dart';
import '../test_material_app.dart';

class NavigationServiceTest extends NavigationService {
  @override
  void goBack() {}

  @override
  Future navigateTo(String routeName, {arguments}) async {}

  @override
  Future replaceTo(String routeName, {arguments}) async {}
}

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
    late LoginProvider provider;

    setUp(() {
      provider =
          LoginProvider(loginUseCase: LoginUseCase(UserRepositoryTest()));
    });

    test('login', () async {
      GenericUser? user = await provider.authenticate();
      expect(user is GenericUser?, true);
    });

    Widget _wrapScreen(LoginScreen loginScreen) {
      return TestMaterialAppWidget(
        home: loginScreen,
      );
    }

    testWidgets("LoginScreen built", (WidgetTester tester) async {
      //  given
      final widget = LoginScreen(provider, NavigationServiceTest());

      //  when
      await tester.pumpWidget(_wrapScreen(widget));

      //  then
      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
