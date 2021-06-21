import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [ProviderScreen]
///
class ProviderScreen<CN extends ChangeNotifier> {
  late final CN changeNotifier;

  MultiProvider buildWithProvider(Widget child) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => this.changeNotifier),
    ], child: child);
  }
}

/// [ProviderScreenState]
///
abstract class ProviderScreenState<CN extends ChangeNotifier,
    S extends StatefulScreen> extends ScreenState<S> with ProviderScreen<CN> {
  ProviderScreenState(CN changeNotifier) {
    this.changeNotifier = changeNotifier;
  }

  @override
  Widget build(BuildContext context) {
    return buildWithProvider(this.buildTemplate());
  }
}

/// [StatelessProviderScreen]
///
abstract class StatelessProviderScreen<CN extends ChangeNotifier>
    extends StatelessScreen with ProviderScreen<CN> {
  StatelessProviderScreen(CN changeNotifier) {
    this.changeNotifier = changeNotifier;
  }

  @override
  Widget build(BuildContext context) {
    return buildWithProvider(this.buildTemplate());
  }
}

/// [ScreenNotifier]
///
abstract class ScreenNotifier with ChangeNotifier {
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
