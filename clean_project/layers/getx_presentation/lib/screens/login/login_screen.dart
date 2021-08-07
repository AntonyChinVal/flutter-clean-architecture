import 'package:components/custom_title.dart';
import 'package:components/progress_modal.dart';
import 'package:domain/model/generic_user/generic_user.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_presentation/configuration/general/session_controller.dart';
import 'package:getx_presentation/screens/login/components/login_form.dart';
import 'package:getx_presentation/screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:screen/controller_screen.dart';
import 'package:get/get.dart';

class GetXLoginScreen extends ControllerScreen<LoginController> {
  GetXLoginScreen(LoginController controller) : super(controller);

  void login(String email, String password) async {
    Get.find<SessionController>().saveUser(GenericUser());
    GenericUser? user =
        await this.controller.authenticate(username: email, password: password);
    if (user != null) {
      Get.find<SessionController>().saveUser(user);
    }
  }

  @override
  Widget buildTemplate(BuildContext context) {
    var sessionController = Get.find<SessionController>();
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              const CustomTitle(text: "Hello!"),
              Obx(() => CustomTitle(
                    text: "${sessionController.user.value.name}",
                  )),
              SizedBox(
                height: 20,
              ),
              LoginForm(
                onLogin: (email, password) {
                  this.login(email, password);
                },
                onForgetPassword: () {},
              ),
            ],
          ),
        ),
        Obx(() =>
            this.controller.inAsyncCall.value ? ProgressModal() : SizedBox())
      ],
    )));
  }
}
