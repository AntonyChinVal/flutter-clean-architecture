import 'package:domain/model/generic_user.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:screen/riverpod_screen.dart';

class LoginNotifier extends ScreenNotifier {
  LoginUseCase? _loginUseCase;

  LoginNotifier({loginUseCase: LoginUseCase}) {
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
