import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Duration screenDuration = const Duration(milliseconds: 500);

/// [ProviderScreen]
///
abstract class Screen extends HookConsumerWidget {
  const Screen({Key? key}) : super(key: key);
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
