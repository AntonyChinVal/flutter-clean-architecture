import 'package:domain/model/generic_user.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:domain/repositories/user_repository.dart';

class TestUserRepository extends UserRepository {
  @override
  Future authenticate({String email = "", String password = ""}) async {}

  @override
  Future<GenericUser> getUser() async {
    return GenericUser();
  }
}

void main() {
  group('Login Use Case', () {
    late UserRepository userRepository;

    setUpAll(() {
      userRepository = TestUserRepository();
    });

    test('execute', () async {
      LoginUseCase loginUseCase = LoginUseCase(userRepository);
      LoginUseCaseParams params = LoginUseCaseParams(email: "", password: "");
      GenericUser user = await loginUseCase.execute(params);
      expect(user is GenericUser, true);
    });
  });
}
