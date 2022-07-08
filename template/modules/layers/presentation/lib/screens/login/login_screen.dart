import 'package:core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/app.dart';
import 'package:presentation/navigation/route_service.dart';
import 'package:presentation/providers/session_provider.dart';
import 'package:presentation/screens/login/components/login_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ui/components/custom_title.dart';

class LoginScreen extends Screen {
  const LoginScreen({Key? key}) : super(key: key);

  void login(WidgetRef ref, String email, String password) async {
    await ref
        .read(sessionProvider)
        .authenticate(username: email, password: password);
    routemaster.push(RouteName.mainScreen);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                login(ref, email, password);
              }),
            ],
          ),
        ),
      ],
    )));
  }
}
