import 'package:flutter/material.dart';

class UserTemplate extends StatelessWidget {

  final GlobalKey<State<StatefulWidget>>? globalKey;

  UserTemplate({
    @required this.globalKey
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body : SafeArea(
        child : Text("Clean Arquitecture App")
      )
      );
  }
}