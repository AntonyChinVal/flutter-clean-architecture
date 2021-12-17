import 'package:components/button.dart';
import 'package:components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password)? onLogin;

  const LoginForm({this.onLogin});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool isSubmitEnable = false;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    this.userController.addListener(this._validate);
    this.passwordController.addListener(this._validate);
  }

  _validate() {
    setState(() {
      isSubmitEnable = this.userController.text.isNotEmpty &&
          this.passwordController.text.isNotEmpty;
    });
  }

  _signin() {
    if (this.widget.onLogin != null) {
      this.widget.onLogin!(this.userController.text, this.userController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 50,
            ),
            Button(
              enabled: this.isSubmitEnable,
              onPressed: this._signin,
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
