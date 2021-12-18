import 'package:domain/model/generic_user.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:screen/riverpod_screen.dart';

class LoginNotifier extends ScreenNotifier {
  LoginUseCase? _loginUseCase;

  LoginNotifier({LoginUseCase? loginUseCase}) {
    _loginUseCase = loginUseCase;
  }

  Future<GenericUser?> authenticate(
      {String? username, String? password}) async {
    try {
      startLoading();
      LoginUseCaseParams params =
          LoginUseCaseParams(email: username!, password: password!);
      GenericUser? user = await _loginUseCase?.execute(params);
      finishLoading();
      return user;
    } catch (_) {
      finishLoading();
    }
  }
}
