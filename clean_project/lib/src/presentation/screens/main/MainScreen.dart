import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/appItemList/AppItemListScreen.dart';
import 'package:clean_project/src/presentation/screens/user/UserScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MainTemplate.dart';

class MainScreen extends StatefulScreen {
  static const String routeName = "Main";

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ScreenState<MainScreen> {
  List<Widget> _widgets = <Widget>[AppItemListScreen(), UserScreen()];
  int _selectedIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget buildTemplate() {
    return MainTemplate(
      selectedIndex: this._selectedIndex,
      widgets: this._widgets,
      onTapHandler: this._onTapHandler,
    );
  }
}
