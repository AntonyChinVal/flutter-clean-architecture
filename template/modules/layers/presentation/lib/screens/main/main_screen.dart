import 'package:flutter/material.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:presentation/providers/session_provider.dart';
import 'package:ui/components/button.dart';
import 'package:ui/components/custom_title.dart';

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
              _navigationService?.navigateTo(RouteName.topicsScreen);
            },
          )
        ],
      ),
    )));
  }
}
