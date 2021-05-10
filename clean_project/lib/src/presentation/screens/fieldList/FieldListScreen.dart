import 'package:clean_project/src/presentation/components/templates/FieldListTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListBloc.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldListScreen extends Screen {

  static String name = "FieldListScreen";
  
  FieldListScreen({Key? key}) : super(key: key);

  @override
  String getName(){
    return "Home";
  }

  @override
  Icon getIcon(){
    return Icon(Icons.home);
  }

  @override
  FieldListScreenState createState() => FieldListScreenState();

}

class FieldListScreenState extends ScreenState<FieldListBloc , FieldListScreen>{
  
  final TextEditingController _searchController = TextEditingController();

  FieldListScreenState() : super(FieldListBloc());

  void getFields(){
    this.bloc.add(GetFieldListEvent());
  }

  @override
  void afterInitState(){
    this.getFields();
    this._searchController.addListener((){
      print(this._searchController.text);
      this.bloc.add(FilterFieldsEvent(this._searchController.text));
    });
  }
  
  @override
  Widget buildTemplate() {
    return FieldListTemplate(
      globalKey: this.globalKey,
      fields : this.bloc.state.fields,
      searchController: _searchController,
      inAsyncCall: this.bloc.state.inAsyncCall,
      );
  }

  @override
  void dispose(){
    super.dispose();
    _searchController.dispose();
  }

}