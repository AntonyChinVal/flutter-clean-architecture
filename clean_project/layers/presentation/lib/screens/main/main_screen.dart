import 'package:components/button.dart';
import 'package:components/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/general/session_provider.dart';
import 'package:provider/provider.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';

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
          CustomTitle(
            text: "Hello ${context.watch<SessionProvider>().user.name}",
          ),
          SizedBox(height: 20),
          Button(
            title: "Logout",
            onPressed: () {
              this._navigationService?.goBack();
            },
          )
        ],
      ),
    )));
  }
}
