import 'package:bloc_test/bloc_test.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/usecases/LoginUseCase.dart';
import 'package:clean_project/src/presentation/screens/login/LoginScreen.dart';
import 'package:clean_project/src/presentation/screens/login/LoginTemplate.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_material_app.dart';

class LoginUseCaseTest extends LoginUseCase {
  LoginUseCaseTest.test() : super.test();

  @override
  Future<AppUser> execute(LoginUseCaseParams params) async {
    return AppUser();
  }
}

class TestLoginScreen extends LoginScreen {
  @override
  LoginScreenState createState() =>
      LoginScreenState.test(LoginBloc.test(LoginUseCaseTest.test()));
}

void main() {
  loginBlocTest();
}

void loginBlocTest() {
  group('LoginBloc', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = LoginBloc.test(LoginUseCaseTest.test());
    });

    test('Initial Login Bloc', () {
      expect(loginBloc.state, LoginiInitState());
    });

    blocTest(
      'Login Authenticate',
      build: () => loginBloc,
      act: (LoginBloc bloc) => bloc.add(AuthenticateEvent("User", "Pass")),
      expect: () => [AuthenticatingState(), LoginiInitState()],
    );
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
        onForgetPassword: () {},
      );

      //  when
      await tester.pumpWidget(_wrapTemplate(widget));

      //  then
      expect(find.byType(LoginTemplate), findsOneWidget);
    });

    testWidgets("LoginScreen built", (WidgetTester tester) async {
      //  given
      final widget = TestLoginScreen();
      widget.getIcon();
      widget.getName();
      LoginScreenState state = widget.createState();
      state.onForgetPassword();
      state.login("email", "password");
      //  when
      await tester.pumpWidget(_wrapScreen(widget));

      //  then
      expect(find.byType(TestLoginScreen), findsOneWidget);
    });
  });
}
