import 'package:clean_project/src/presentation/components/atoms/CButton.dart';
import 'package:clean_project/src/presentation/components/atoms/CTextFormField.dart';
import 'package:clean_project/src/presentation/components/atoms/CTextLink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class LoginForm extends StatefulWidget {

  final void Function(String email,String password)? onLogin;
  final void Function()? onGoogleLogin;
  final void Function()? onFacebookLogin;
  final void Function()? onForgetPassword;

  LoginForm({Key? key, 
  @required this.onLogin, 
  @required this.onGoogleLogin, 
  @required this.onFacebookLogin, 
  @required this.onForgetPassword}) : super(key: key);
  
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
              }, title: 'Ingresar',color: Colors.green,),
              DotEnv.env["FIREBASE"] == "true" ? 
              CButton(onPressed: (){
                widget.onGoogleLogin!();
              }, title: 'Google',color: Colors.red,) : SizedBox(),
              DotEnv.env["FIREBASE"] == "true" ? 
              CButton(onPressed: (){
                widget.onFacebookLogin!();
              }, title: 'Facebook',color: Colors.blue,) : SizedBox(),
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