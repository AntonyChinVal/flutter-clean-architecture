import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/user/bloc/UserBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserTemplate.dart';

class UserScreen extends Screen {
  static const String routeName = "User";
  UserScreen({Key? key}) : super(key: key);

  @override
  String getName() {
    return "You";
  }

  @override
  Icon getIcon() {
    return Icon(Icons.person);
  }

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends ScreenState<UserBloc, UserScreen> {
  UserScreenState() : super(UserBloc());

  @override
  Widget buildTemplate() {
    return UserTemplate();
  }
}
