import 'package:flutter/material.dart';

class SplashTemplate extends StatelessWidget {

  final GlobalKey<State<StatefulWidget>>? globalKey;

  SplashTemplate({
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