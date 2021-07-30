import 'package:domain/model/generic_user/generic_user.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';
import 'package:screen/controller_screen.dart';
import 'package:get/get.dart';

class LoginController extends ScreenController {
  LoginUseCase? _loginUseCase;

  LoginController({loginUseCase: LoginUseCase}) {
    this._loginUseCase = loginUseCase;
  }

  authenticate(
      {username: String,
      password: String,
      Function(GenericUser)? saveUser}) async {
    try {
      this.startLoading();
      LoginUseCaseParams params =
          LoginUseCaseParams(email: username, password: password);
      GenericUser? user = await this._loginUseCase?.execute(params);
      this.finishLoading();
      if (saveUser != null && user != null) {
        saveUser(user);
      }
      Get.to(GetXRouteName.loginScreen);
    } catch (_) {
      this.finishLoading();
    }
  }
}
