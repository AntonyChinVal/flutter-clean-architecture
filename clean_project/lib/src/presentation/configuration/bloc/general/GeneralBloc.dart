
import 'package:bloc/bloc.dart';
import 'package:clean_project/src/presentation/configuration/bloc/general/GeneralEvent.dart';
import 'package:clean_project/src/presentation/configuration/bloc/general/GeneralState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState>{
  
  GeneralBloc() : super(GeneralState());

  @override
  Stream<GeneralState> mapEventToState(GeneralEvent event) async* {
    if(event is Loading){
      _showSpinner(event);
    }else if(event is DissmissLoading){
      _dissmissSipnner(event);
    }
  }

  void _showSpinner(Loading event){
    // showDialog(context: event.context,builder: (BuildContext context) {return CProgressModal();});
  }

  void _dissmissSipnner(DissmissLoading event){
    Navigator.pop(event.context);
  }
  
}