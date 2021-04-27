import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/presentation/screens/splash/bloc/SplashEvent.dart';
import 'package:clean_project/src/presentation/screens/splash/bloc/SplashState.dart';

class SplashBloc extends ScreenBloc<SplashEvent, SplashState>{

  SplashBloc() : super(SplashInitState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    
  }

}