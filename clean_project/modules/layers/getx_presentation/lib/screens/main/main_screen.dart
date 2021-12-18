import 'package:getx_presentation/configuration/general/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';
import 'package:ui/components/button.dart';
import 'package:ui/components/custom_title.dart';

class GetXMainScreen extends StatelessWidget {
  const GetXMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sessionController = Get.find<SessionController>();
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => CustomTitle(
                text: "Hello ${sessionController.user.value.name}",
              )),
          const SizedBox(height: 20),
          Button(
            title: "Logout",
            onPressed: () {
              Get.back();
            },
          ),
          const SizedBox(height: 20),
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
