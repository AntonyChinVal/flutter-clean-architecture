import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/app.dart';
import 'package:presentation/navigation/route_service.dart';
import 'package:presentation/providers/session_provider.dart';
import 'package:ui/components/button.dart';
import 'package:ui/components/custom_title.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
              routemaster.popRoute();
            },
          ),
          const SizedBox(height: 20),
          Button(
            title: "Topics",
            onPressed: () {
              routemaster.push(RouteName.topicsScreen);
            },
          )
        ],
      ),
    )));
  }
}
