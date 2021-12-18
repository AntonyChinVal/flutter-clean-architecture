import 'package:components/custom_title.dart';
import 'package:components/progress_modal.dart';
import 'package:domain/model/generic_user.dart';
import 'package:flutter/material.dart';
import 'package:presentation/app.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:presentation/screens/login/components/login_form.dart';
import 'package:presentation/screens/login/login_notifier.dart';
import 'package:screen/riverpod_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ProviderScreen<LoginNotifier> {
  final NavigationService? _navigationService;
  LoginScreen(LoginNotifier notifier, this._navigationService, {Key? key})
      : super(notifier, key: key);

  void login(WidgetRef ref, String email, String password) async {
    GenericUser? user = await ref
        .read(provider)
        .authenticate(password: password, username: email);
    ref.read(sessionProvider).saveUser(user!);
    _navigationService?.navigateTo(RouteName.mainScreen);
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
        ref.watch(provider).inAsyncCall
            ? const ProgressModal()
            : const SizedBox()
      ],
    )));
  }
}
