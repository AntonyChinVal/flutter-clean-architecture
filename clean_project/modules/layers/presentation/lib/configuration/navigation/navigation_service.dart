import 'package:flutter/material.dart';

abstract class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName, {dynamic arguments});
  Future<dynamic> replaceTo(String routeName, {dynamic arguments});
  void goBack();
}

class NavigationServiceImpl extends NavigationService {
  @override
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
