import 'package:domain/model/generic_user.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:screen/controller_screen.dart';

class LoginController extends ScreenController {
  LoginUseCase? _loginUseCase;

  LoginController({loginUseCase: LoginUseCase}) {
    this._loginUseCase = loginUseCase;
  }

  Future<GenericUser?> authenticate(
      {username: String, password: String}) async {
    try {
      this.startLoading();
      LoginUseCaseParams params =
          LoginUseCaseParams(email: username, password: password);
      GenericUser? user = await this._loginUseCase?.execute(params);
      this.finishLoading();
      return user;
    } catch (_) {
      this.finishLoading();
    }
  }
}
