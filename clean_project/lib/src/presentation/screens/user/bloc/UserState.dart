import 'package:clean_project/src/presentation/core/ScreenBloc.dart';

abstract class UserState extends ScreenBlocState{
  UserState(bool isLoading) : super(isLoading);
}

class UserInitState extends UserState{
  UserInitState()  : super(false);
}