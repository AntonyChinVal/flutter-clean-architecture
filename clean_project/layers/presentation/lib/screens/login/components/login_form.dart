import 'package:flutter/material.dart';
import 'package:presentation/components/button.dart';
import 'package:presentation/components/custom_text_form_field.dart';
import 'package:presentation/components/text_link.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password)? onLogin;
  final void Function()? onForgetPassword;

  const LoginForm(
      {Key? key, @required this.onLogin, @required this.onForgetPassword})
      : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Build LoginForm");
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              label: 'Username',
              controller: userController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Password',
              controller: passwordController,
            ),
            SizedBox(
              height: 30,
            ),
            TextLink(
              onPressed: widget.onForgetPassword,
              linkTitle: 'Forgot password?',
              alignment: MainAxisAlignment.end,
            ),
            SizedBox(
              height: 50,
            ),
            Button(
              onPressed: () {
                widget.onLogin!(userController.text, passwordController.text);
              },
              title: 'Sign in',
              color: Colors.green,
            ),
          ],
        ));
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
