import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestMaterialAppWidget extends StatelessWidget {
  final Widget? home;
  final NavigatorObserver? navigatorObserver;

  TestMaterialAppWidget({Key? key, this.home, this.navigatorObserver});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Widget Test', home: home);
  }
}
