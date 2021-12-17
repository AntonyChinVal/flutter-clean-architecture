import 'package:components/button.dart';
import 'package:components/custom_title.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_presentation/configuration/general/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';

class GetXMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sessionController = Get.find<SessionController>();
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => CustomTitle(
                text: "Hello ${sessionController.user.value.name}",
              )),
          SizedBox(height: 20),
          Button(
            title: "Logout",
            onPressed: () {
              Get.back();
            },
          ),
          SizedBox(height: 20),
          Button(
            title: "Topics",
            onPressed: () {
              Get.toNamed(GetXRouteName.topicsScreen);
            },
          )
        ],
      ),
    )));
  }
}
