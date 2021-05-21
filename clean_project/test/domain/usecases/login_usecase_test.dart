import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/usecases/LoginUseCase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/TestAuthenticationRepository.dart';
import '../repositories/TestSharedPreferencesRepository.dart';
import '../repositories/TestUserRepository.dart';

void main() {
  loginUseCaseTest();
}

void loginUseCaseTest() {
  group("Login UseCase", () {
    LoginUseCase loginUseCase = LoginUseCase(TestAuthenticationRepository(),
        TestUserRepository(), TestSharedPreferencesRepository());
    LoginUseCase loginUseCaseFail = LoginUseCase(null, null, null);
    test('Login UseCase Success', () async {
      LoginUseCaseParams params =
          LoginUseCaseParams(email: "Test", password: "Pass");

      AppUser? user = await loginUseCase.execute(params);
      expect(user != null, true);
    });

    test('Login UseCase Fail', () async {
      LoginUseCaseParams params =
          LoginUseCaseParams(email: "Test", password: "Pass");

      AppUser? user = await loginUseCaseFail.execute(params);
      expect(user != null, false);
    });
  });
}
