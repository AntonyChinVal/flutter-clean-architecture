import 'package:clean_project/src/presentation/core/ScreenBloc.dart';

abstract class MainState extends ScreenBlocState{
  MainState() : super(false);
}

class MainInitState extends MainState{
  MainInitState()  : super();
}