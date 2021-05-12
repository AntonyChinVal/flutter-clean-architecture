import 'package:clean_project/src/presentation/components/templates/MainTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/Main/bloc/MainBloc.dart';
import 'package:clean_project/src/presentation/screens/fieldList/FieldListScreen.dart';
import 'package:clean_project/src/presentation/screens/user/UserScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends Screen {

  static const String routeName = "Main";
  MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();

}

class MainScreenState extends ScreenState<MainBloc , MainScreen>{

  List<Screen> _widgets = <Screen>[FieldListScreen(), UserScreen()];
  int _selectedIndex = 0;

  MainScreenState() : super(MainBloc());

  void _onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget buildTemplate() {
    return MainTemplate(
      globalKey: globalKey, 
      selectedIndex: this._selectedIndex, 
      widgets: this._widgets, 
      onTapHandler: this._onTapHandler,
    );
  }

}