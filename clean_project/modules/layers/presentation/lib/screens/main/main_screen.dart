import 'package:components/button.dart';
import 'package:components/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:presentation/app.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/configuration/navigation/route_service.dart';

class MainScreen extends StatelessWidget {
  final NavigationService? _navigationService;
  const MainScreen(this._navigationService, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HookConsumer(
            builder: (context, ref, child) {
              final welcomeString = ref.watch(sessionProvider).user.name;

              return CustomTitle(
                text: "Hello $welcomeString",
              );
            },
          ),
          const SizedBox(height: 20),
          Button(
            title: "Logout",
            onPressed: () {
              _navigationService?.goBack();
            },
          ),
          const SizedBox(height: 20),
          Button(
            title: "Topics",
            onPressed: () {
              _navigationService?.navigateTo(RouteName.topicsSreen);
            },
          )
        ],
      ),
    )));
  }
}
