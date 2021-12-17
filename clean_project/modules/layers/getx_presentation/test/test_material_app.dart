import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_presentation/configuration/general/session_controller.dart';

class TestMaterialAppWidget extends StatelessWidget {
  final Widget? home;
  final NavigatorObserver? navigatorObserver;

  TestMaterialAppWidget({Key? key, this.home, this.navigatorObserver});

  @override
  Widget build(BuildContext context) {
    Get.put(SessionController());
    return MaterialApp(title: 'Widget Test', home: home);
  }
}
