import 'package:clean_project/src/presentation/components/atoms/CButton.dart';
import 'package:clean_project/src/presentation/components/atoms/CTextFormField.dart';
import 'package:clean_project/src/presentation/components/atoms/CTextLink.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email,String password)? onLogin;
  final void Function()? onForgetPassword;

  LoginForm({Key? key, @required this.onLogin, @required this.onForgetPassword}) : super(key: key);
  
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController userController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
            children: <Widget>[
              CTextFormField(label : 'Username', controller: userController,),
              SizedBox(height: 20,),
              CTextFormField(label : 'Password', controller: passwordController,),
              SizedBox(height: 30,),
              CTextLink(onPressed: widget.onForgetPassword,linkTitle: 'Olvidaste tu contraseña?',alignment: MainAxisAlignment.end,),
              SizedBox(height: 50,),
              CButton(onPressed: (){
                widget.onLogin!(userController.text, passwordController.text);
              }, title: 'Ingresar',),
            ],
          ) 
    );
  }

  @override
  void dispose(){
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}