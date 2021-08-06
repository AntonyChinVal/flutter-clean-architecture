import 'package:components/custom_title.dart';
import 'package:components/progress_modal.dart';
import 'package:domain/model/generic_user/generic_user.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:presentation/configuration/general/session_provider.dart';
import 'package:presentation/screens/login/components/login_form.dart';
import 'package:presentation/screens/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen/provider_screen.dart';

class LoginScreen extends ProviderScreen<LoginProvider> {
  LoginScreen(LoginProvider provider) : super(provider);

  void login(BuildContext context, String email, String password) {
    context.read<SessionProvider>().saveUser(GenericUser());
    context.read<LoginProvider>().authenticate(
        username: email,
        password: password,
        saveUser: (user) {
          context.read<SessionProvider>().saveUser(user);
        });
  }

  @override
  Widget buildTemplate(BuildContext context) {
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
              CustomTitle(
                text: "${context.watch<SessionProvider>().user.name}",
              ),
              SizedBox(
                height: 20,
              ),
              LoginForm(
                onLogin: (email, password) {
                  this.login(context, email, password);
                },
                onForgetPassword: () {},
              ),
            ],
          ),
        ),
        context.watch<LoginProvider>().inAsyncCall
            ? ProgressModal()
            : SizedBox()
      ],
    )));
  }
}