import 'package:components/button.dart';
import 'package:components/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:presentation/app.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/configuration/navigation/route_service.dart';

class MainScreen extends StatelessWidget {
  final NavigationService? _navigationService;
  MainScreen(this._navigationService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HookConsumer(
            builder: (context, ref, child) {
              final welcomeString = ref.watch(sessionProvider).user.name;

              return CustomTitle(
                text: "Hello ${welcomeString}",
              );
            },
          ),
          SizedBox(height: 20),
          Button(
            title: "Logout",
            onPressed: () {
              this._navigationService?.goBack();
            },
          ),
          SizedBox(height: 20),
          Button(
            title: "Topics",
            onPressed: () {
              this._navigationService?.navigateTo(RouteName.topicsSreen);
            },
          )
        ],
      ),
    )));
  }
}
