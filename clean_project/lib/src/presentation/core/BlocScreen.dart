import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
 *  BlocScreenState
 */
abstract class BlocScreenState<B extends Bloc, S extends StatefulScreen>
    extends ScreenState<S> {
  B _bloc;

  BlocScreenState(this._bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => this._bloc,
      child: this.buildTemplate(),
    );
  }

  B get bloc {
    return this._bloc;
  }
}

/*
 *  StatelessBlocScreen
 */
abstract class StatelessBlocScreen<B extends Bloc> extends StatelessScreen {
  final B _bloc;

  StatelessBlocScreen(this._bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => this._bloc,
      child: this.buildTemplate(),
    );
  }

  B get bloc {
    return this._bloc;
  }
}

abstract class BlocState extends Equatable {
  final bool inAsyncCall;

  BlocState(this.inAsyncCall);

  @override
  List<Object> get props => [inAsyncCall];
}
