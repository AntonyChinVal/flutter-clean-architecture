import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/presentation/screens/Main/bloc/MainEvent.dart';
import 'package:clean_project/src/presentation/screens/main/bloc/MainState.dart';

class MainBloc extends ScreenBloc<MainSEvent, MainState>{


  MainBloc() : super(MainInitState());

  @override
  Stream<MainState> mapEventToState(MainSEvent event) async* {
  }

}