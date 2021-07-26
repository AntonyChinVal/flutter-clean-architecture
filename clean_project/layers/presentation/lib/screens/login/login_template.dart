import 'package:flutter/material.dart';
import 'package:presentation/components/custom_title.dart';
import 'package:presentation/components/organisms/login_form.dart';
import 'package:presentation/components/progress_modal.dart';
import 'package:presentation/configuration/general/session_notifier.dart';
import 'package:presentation/screens/login/login_provider.dart';
import 'package:provider/provider.dart';

class LoginTemplate extends StatelessWidget {
  final void Function(String email, String password)? onLogin;
  final void Function()? onForgetPassword;

  LoginTemplate({@required this.onLogin, @required this.onForgetPassword});

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 20,
              ),
              LoginForm(
                onLogin: this.onLogin,
                onForgetPassword: this.onForgetPassword,
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
