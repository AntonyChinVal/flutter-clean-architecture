import 'package:domain/model/generic_user/generic_user.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:screen/provider_screen.dart';

class LoginProvider extends ScreenProvider {
  LoginUseCase? _loginUseCase;
  NavigationService? _navigationService;

  LoginProvider(
      {loginUseCase: LoginUseCase, navigationService: NavigationService}) {
    this._loginUseCase = loginUseCase;
    this._navigationService = navigationService;
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
      // _navigationService?.navigateTo(RouteName.loginScreen);
    } catch (_) {
      this.finishLoading();
    }
  }
}
