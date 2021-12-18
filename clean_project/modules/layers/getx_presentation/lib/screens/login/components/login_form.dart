import 'package:components/button.dart';
import 'package:components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password)? onLogin;

  const LoginForm({Key? key, this.onLogin}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool isSubmitEnable = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userController.addListener(_validate);
    passwordController.addListener(_validate);
  }

  _validate() {
    setState(() {
      isSubmitEnable =
          userController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  _signin() {
    if (widget.onLogin != null) {
      widget.onLogin!(userController.text, userController.text);
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
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Password',
              controller: passwordController,
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              enabled: isSubmitEnable,
              onPressed: _signin,
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
