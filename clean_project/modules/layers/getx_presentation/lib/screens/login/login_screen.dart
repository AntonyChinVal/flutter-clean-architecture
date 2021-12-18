import 'package:domain/model/generic_user.dart';
import 'package:getx_presentation/configuration/general/session_controller.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';
import 'package:getx_presentation/screens/login/components/login_form.dart';
import 'package:getx_presentation/screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:screen/controller_screen.dart';
import 'package:get/get.dart';
import 'package:ui/components/custom_title.dart';
import 'package:ui/components/progress_modal.dart';

class GetXLoginScreen extends ControllerScreen<LoginController> {
  GetXLoginScreen(LoginController controller, {Key? key})
      : super(
          controller,
          key: key,
        );

  void login(String email, String password) async {
    Get.find<SessionController>().saveUser(GenericUser());
    GenericUser? user =
        await controller.authenticate(username: email, password: password);
    if (user != null) {
      Get.find<SessionController>().saveUser(user);
      Get.toNamed(GetXRouteName.mainScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const CustomTitle(text: "Hello!"),
              const SizedBox(
                height: 20,
              ),
              LoginForm(onLogin: (email, password) {
                login(email, password);
              }),
            ],
          ),
        ),
        Obx(() => controller.inAsyncCall.value
            ? const ProgressModal()
            : const SizedBox())
      ],
    )));
  }
}
