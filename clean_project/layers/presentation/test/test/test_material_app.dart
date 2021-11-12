import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/general/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sessionProvider = ChangeNotifierProvider((ref) => SessionProvider());

class TestMaterialAppWidget extends StatelessWidget {
  final Widget? home;
  final NavigatorObserver? navigatorObserver;

  TestMaterialAppWidget({Key? key, this.home, this.navigatorObserver});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(title: 'Widget Test', home: home),
    );
  }
}
