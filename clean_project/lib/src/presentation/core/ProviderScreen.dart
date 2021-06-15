import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
 *  ProviderScreenState
 */
abstract class ProviderScreenState<CN extends ChangeNotifier,
    S extends StatefulScreen> extends ScreenState<S> {
  CN _changeNotifier;

  ProviderScreenState(this._changeNotifier);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => this._changeNotifier),
    ], child: this.buildTemplate());
  }

  CN get changeNotifier {
    return this._changeNotifier;
  }
}

/*
 * StatelessProviderScreen
 */
abstract class StatelessProviderScreen<CN extends ChangeNotifier>
    extends StatelessScreen {
  final CN _changeNotifier;

  StatelessProviderScreen(this._changeNotifier);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => this._changeNotifier),
    ], child: this.buildTemplate());
  }

  CN get changeNotifier {
    return this._changeNotifier;
  }
}

/*
 * ScreenNotifier
 */
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
