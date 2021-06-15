import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UserTemplate.dart';

class UserScreen extends StatelessScreen {
  static const String routeName = "User";

  @override
  String getName() {
    return "You";
  }

  @override
  Icon getIcon() {
    return Icon(Icons.person);
  }

  @override
  Widget buildTemplate() {
    return UserTemplate();
  }
}
