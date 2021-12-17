import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [ProviderScreen]
///
abstract class ProviderScreen<CN extends ChangeNotifier>
    extends HookConsumerWidget {
  late final CN _changeNotifier;
  late final ChangeNotifierProvider<CN> _provider;

  ProviderScreen(CN changeNotifier) {
    this._changeNotifier = changeNotifier;
    this._provider = ChangeNotifierProvider((ref) => _changeNotifier);
  }

  ChangeNotifierProvider<CN> get provider => this._provider;
}

/// [ScreenNotifier]
///
abstract class ScreenNotifier extends ChangeNotifier {
  bool _inAsyncCall = false;

  startLoading() {
    this._inAsyncCall = true;
    notifyListeners();
  }

  finishLoading() {
    this._inAsyncCall = false;
    notifyListeners();
  }

  bool get inAsyncCall => this._inAsyncCall;
}
