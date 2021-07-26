import 'package:flutter/material.dart';
import 'package:presentation/core/screen.dart';
import 'package:provider/provider.dart';

/// [ProviderScreen]
///
class ProviderScreen<CN extends ChangeNotifier> {
  late final CN provider;

  MultiProvider buildWithProvider(Widget child, BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => this.provider),
    ], child: child);
  }
}

/// [ProviderScreenState]
///
abstract class ProviderScreenState<CN extends ChangeNotifier,
    S extends StatefulScreen> extends ScreenState<S> with ProviderScreen<CN> {
  ProviderScreenState(CN provider) {
    this.provider = provider;
  }

  @override
  Widget build(BuildContext context) {
    return buildWithProvider(this.buildTemplate(), context);
  }
}

/// [StatelessProviderScreen]
///
abstract class StatelessProviderScreen<CN extends ChangeNotifier>
    extends StatelessScreen with ProviderScreen<CN> {
  StatelessProviderScreen(CN provider) {
    this.provider = provider;
  }

  @override
  Widget build(BuildContext context) {
    return buildWithProvider(this.buildTemplate(), context);
  }
}

/// [ScreenProvider]
///
abstract class ScreenProvider with ChangeNotifier {
  bool inAsyncCall = false;

  startLoading() {
    this.inAsyncCall = true;
    notifyListeners();
  }

  finishLoading() {
    this.inAsyncCall = false;
    notifyListeners();
  }
}
