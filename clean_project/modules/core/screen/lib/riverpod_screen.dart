import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [ProviderScreen]
///
abstract class ProviderScreen<CN extends ChangeNotifier>
    extends HookConsumerWidget {
  late final CN _changeNotifier;
  late final ChangeNotifierProvider<CN> _provider;

  ProviderScreen(CN changeNotifier, {Key? key}) : super(key: key) {
    _changeNotifier = changeNotifier;
    _provider = ChangeNotifierProvider((ref) => _changeNotifier);
  }

  ChangeNotifierProvider<CN> get provider => _provider;
}

/// [ScreenNotifier]
///
abstract class ScreenNotifier extends ChangeNotifier {
  bool _inAsyncCall = false;

  startLoading() {
    _inAsyncCall = true;
    notifyListeners();
  }

  finishLoading() {
    _inAsyncCall = false;
    notifyListeners();
  }

  bool get inAsyncCall => _inAsyncCall;
}
