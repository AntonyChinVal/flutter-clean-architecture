import 'package:clean_project/src/domain/usecases/FacebookLoginUseCase.dart';
import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';
import 'package:clean_project/src/presentation/configuration/navigation/NavigationService.dart';
import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/domain/usecases/LoginUseCase.dart';
import 'package:clean_project/src/domain/usecases/GoogleLoginUseCase.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginState.dart';
import 'package:clean_project/src/presentation/screens/main/MainScreen.dart';

class LoginBloc extends ScreenBloc<LoginSEvent, LoginState> {
  LoginUseCase? _loginUseCase;
  GoogleLoginUseCase? _googleLoginUseCase;
  FacebookLoginUseCase? _facebookLoginUseCase;
  NavigationService? _navigationService;

  LoginBloc() : super(LoginiInitState()) {
    this._loginUseCase = getIt<LoginUseCase>();
    this._googleLoginUseCase = getIt<GoogleLoginUseCase>();
    this._facebookLoginUseCase = getIt<FacebookLoginUseCase>();
    this._navigationService = getIt<NavigationService>();
  }

  LoginBloc.test(LoginUseCase loginUseCase) : super(LoginiInitState()) {
    this._loginUseCase = loginUseCase;
  }

  @override
  Stream<LoginState> mapEventToState(LoginSEvent event) async* {
    if (event is AuthenticateEvent) {
      print("Auth Event");
      yield* _autenticate(event);
    } else if (event is GooggleAuthenticateEvent) {
      print("Google Auth Event");
      yield* _googleAutenticate(event);
    } else if (event is FacebookAuthenticateEvent) {
      print("Facebook Auth Event");
      yield* _facebookutenticate(event);
    }
  }

  Stream<LoginState> _autenticate(AuthenticateEvent event) async* {
    try {
      print("Auth Event Execute");
      yield AuthenticatingState();
      LoginUseCaseParams params =
          LoginUseCaseParams(email: event.username, password: event.password);
      await this._loginUseCase?.execute(params);
      yield LoginiInitState();
      _navigationService?.navigateTo(MainScreen.routeName);
    } catch (_) {
      print("Auth Event False");
      yield LoginiInitState();
    }
  }

  Stream<LoginState> _googleAutenticate(GooggleAuthenticateEvent event) async* {
    try {
      print("Auth Event Execute");
      yield AuthenticatingState();
      await this._googleLoginUseCase?.execute(GoogleLoginUseCaseParams());
      yield LoginiInitState();
      _navigationService?.navigateTo(MainScreen.routeName);
    } catch (_) {
      yield LoginiInitState();
    }
  }

  Stream<LoginState> _facebookutenticate(
      FacebookAuthenticateEvent event) async* {
    try {
      print("Auth Event Execute");
      yield AuthenticatingState();
      await this._facebookLoginUseCase?.execute(FacebookLoginUseCaseParams());
      yield LoginiInitState();
      _navigationService?.navigateTo(MainScreen.routeName);
    } catch (_) {
      yield LoginiInitState();
    }
  }
}
