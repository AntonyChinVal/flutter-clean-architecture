import 'package:clean_project/src/presentation/components/templates/UserTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/user/bloc/UserBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserScreen extends Screen {
  
  static String name = "UserScreen";

  UserScreen({Key? key}) : super(key: key);

  @override
  String getName(){
    return "You";
  }

  @override
  Icon getIcon(){
    return Icon(Icons.person);
  }

  @override
  UserScreenState createState() => UserScreenState();

}

class UserScreenState extends ScreenState<UserBloc , UserScreen>{
  
  UserScreenState() : super(UserBloc());

  @override
  Widget buildTemplate() {

    return UserTemplate(globalKey: this.globalKey);

  }

}