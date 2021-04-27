import 'package:clean_project/src/presentation/core/ScreenBloc.dart';

abstract class SplashState extends ScreenBlocState{
  SplashState(bool isLoading) : super(isLoading);
}

class SplashInitState extends SplashState{
  SplashInitState()  : super(false);
}