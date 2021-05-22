import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';
import 'package:clean_project/src/presentation/configuration/navigation/NavigationService.dart';
import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/domain/usecases/LoginUseCase.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginState.dart';
import 'package:clean_project/src/presentation/screens/main/MainScreen.dart';

class LoginBloc extends ScreenBloc<LoginSEvent, LoginState> {
  LoginUseCase? _loginUseCase;
  NavigationService? _navigationService;

  LoginBloc() : super(LoginiInitState()) {
    this._loginUseCase = getIt<LoginUseCase>();
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
}
