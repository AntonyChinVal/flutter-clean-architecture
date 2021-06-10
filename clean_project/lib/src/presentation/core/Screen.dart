import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ScreenState<SB extends ScreenBloc, S extends Screen>
    extends State<S> {
  final GlobalKey<State<StatefulWidget>> globalKey =
      GlobalKey<State<StatefulWidget>>();
  SB? _bloc;

  ScreenState(this._bloc);

  SB? get bloc {
    return this._bloc;
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    this.afterInitState();
  }

  Widget buildTemplate();

  @override
  Widget build(BuildContext context) {
    return this._bloc != null
        ? BlocProvider(
            create: (context) => this._bloc!,
            child: BlocBuilder<SB, ScreenBlocState>(builder: (context, state) {
              return this.buildTemplate();
            }))
        : this.buildTemplate();
  }

  // MARK: Only BlocProvider
  // @override
  // Widget build(BuildContext context) {
  //   return this._bloc != null
  //       ? BlocProvider(
  //           create: (context) => this._bloc!,
  //           child: this.buildTemplate(),
  //         )
  //       : this.buildTemplate();
  // }

  @override
  @mustCallSuper
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  void afterInitState() {
    print("After Init State");
  }
}

abstract class Screen extends StatefulWidget {
  Screen({Key? key}) : super(key: key);

  String getName() {
    return "Screen";
  }

  Icon getIcon() {
    return Icon(Icons.home);
  }
}
