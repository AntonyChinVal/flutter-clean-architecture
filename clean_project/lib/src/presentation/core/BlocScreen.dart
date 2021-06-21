import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BlocScreen]
///
class BlocScreen<B extends Bloc> {
  late final B bloc;

  BlocProvider buildWithProvider(Widget child) {
    return BlocProvider(
      create: (context) => this.bloc,
      child: child,
    );
  }
}

/// [BlocScreenState]
///
abstract class BlocScreenState<B extends Bloc, S extends StatefulScreen>
    extends ScreenState<S> with BlocScreen<B> {
  BlocScreenState(B bloc) {
    this.bloc = bloc;
  }

  @override
  Widget build(BuildContext context) {
    return buildWithProvider(this.buildTemplate());
  }
}

/// [StatelessBlocScreen]
///
abstract class StatelessBlocScreen<B extends Bloc> extends StatelessScreen
    with BlocScreen<B> {
  StatelessBlocScreen(B bloc) {
    this.bloc = bloc;
  }

  @override
  Widget build(BuildContext context) {
    return buildWithProvider(this.buildTemplate());
  }
}

/// [BlocState]
///
abstract class BlocState extends Equatable {
  final bool inAsyncCall;

  BlocState(this.inAsyncCall);

  @override
  List<Object> get props => [inAsyncCall];
}
