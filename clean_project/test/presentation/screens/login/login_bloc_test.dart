import 'package:bloc_test/bloc_test.dart';
import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/usecases/LoginUseCase.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginState.dart';
import 'package:flutter_test/flutter_test.dart';

class LoginUseCaseTest extends LoginUseCase {
  LoginUseCaseTest.test() : super.test();

  @override
  Future<AppUser> execute(LoginUseCaseParams params) async {
    return AppUser();
  }
}

void main() {
  configureInjection();
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
  });
}
