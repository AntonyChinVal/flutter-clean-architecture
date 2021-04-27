import 'package:clean_project/src/presentation/components/templates/FieldListTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListBloc.dart';
import 'package:clean_project/src/presentation/screens/fieldList/bloc/FieldListEvent.dart';
import 'package:flutter/cupertino.dart';

class FieldListScreen extends Screen {

  FieldListScreen({Key? key}) : super(key: key);

  @override
  FieldListScreenState createState() => FieldListScreenState();

}

class FieldListScreenState extends ScreenState<FieldListBloc , FieldListScreen>{

  FieldListScreenState() : super(FieldListBloc());
  final TextEditingController _searchController = TextEditingController();

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