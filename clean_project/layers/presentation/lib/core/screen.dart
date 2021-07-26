import 'package:flutter/material.dart';

/// [Screen]
///
abstract class Screen {}

/// [TemplateBuilder]
///
abstract class TemplateBuilder {
  Widget buildTemplate();
}

/// [StatefulScreen]
///
abstract class StatefulScreen extends StatefulWidget with Screen {
  StatefulScreen({Key? key}) : super(key: key);
}

/// [ScreenState]
///
abstract class ScreenState<S extends StatefulScreen> extends State<S>
    with TemplateBuilder {
  final GlobalKey<State<StatefulWidget>> globalKey =
      GlobalKey<State<StatefulWidget>>();

  @override
  Widget build(BuildContext context) {
    return this.buildTemplate();
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    this.afterInitState();
  }

  void afterInitState() {
    print("After Init State");
  }
}

/// [StatelessScreen]
///
abstract class StatelessScreen extends StatelessWidget
    with Screen, TemplateBuilder {
  const StatelessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.buildTemplate();
  }
}
