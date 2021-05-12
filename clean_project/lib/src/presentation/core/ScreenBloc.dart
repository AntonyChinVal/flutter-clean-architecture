import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ScreenBloc<T, S extends ScreenBlocState> extends Bloc<T, S> {

  @mustCallSuper
  ScreenBloc(S initialState) : super(initialState);

  @mustCallSuper
  void dispose(){
    this.close();
  }

}

abstract class ScreenBlocState extends Equatable{
  
  final bool inAsyncCall;

  ScreenBlocState(this.inAsyncCall);
  
  @override
  List<Object> get props => [inAsyncCall];
  
}
