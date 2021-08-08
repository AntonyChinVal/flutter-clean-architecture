import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen.dart';

/// [_ProviderWrappedWidget]
///
class _ProviderWrappedWidget extends StatelessWidget {
  final Widget Function(BuildContext)? builder;

  const _ProviderWrappedWidget({this.builder});

  @override
  Widget build(BuildContext context) {
    return this.builder != null
        ? this.builder!(context)
        : Text("Builder Required");
  }
}

/// [ProviderScreen]
///
abstract class ProviderScreen<CN extends ChangeNotifier> extends Screen {
  late final CN _provider;

  ProviderScreen(CN provider) {
    this._provider = provider;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => this._provider),
    ], child: _ProviderWrappedWidget(builder: this.buildTemplate));
  }

  CN get provider => this._provider;
}

/// [ScreenProvider]
///
abstract class ScreenProvider extends ChangeNotifier {
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
