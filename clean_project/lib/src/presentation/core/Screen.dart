import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ScreenState<SB extends ScreenBloc , S extends Screen>  extends State<S> with WidgetsBindingObserver {

  final GlobalKey<State<StatefulWidget>> globalKey = GlobalKey<State<StatefulWidget>>();
  SB _bloc;
  bool? _isMounted;

  ScreenState(this._bloc) {
    _isMounted = true;
  }

  SB get bloc{
    return this._bloc;
  }

  @override
  @mustCallSuper
  void initState(){
    super.initState();
    this.afterInitState();
  }

  Widget buildTemplate();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context)=> this._bloc,
      child: BlocBuilder<SB,ScreenBlocState>(
        builder : (context , state){
          return this.buildTemplate();
        }
      )
    );
  }

  @override
  @mustCallSuper
  void dispose() {
    _isMounted = false;
    _bloc.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_isMounted!) {
      switch (state) {
        case AppLifecycleState.inactive:
          onInActive();
          break;
        case AppLifecycleState.paused:
          onPaused();
          break;
        case AppLifecycleState.resumed:
          onResumed();
          break;
        case AppLifecycleState.detached:
          onDetached();
          break;
      }
    }
  }

  void afterInitState(){}

  void onInActive() {}

  void onPaused() {}

  void onResumed() {}

  void onDetached() {}

}

abstract class Screen extends StatefulWidget {
  final Key? key;
  Screen({this.key}) : super(key: key);

  String getName() {
    return "Screen"; 
  }

  Icon getIcon() {
    return Icon(Icons.home);
  }

}
   