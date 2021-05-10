import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/presentation/screens/user/bloc/UserEvent.dart';
import 'package:clean_project/src/presentation/screens/user/bloc/UserState.dart';

class UserBloc extends ScreenBloc<UserEvent, UserState>{

  UserBloc() : super(UserInitState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    
  }

}