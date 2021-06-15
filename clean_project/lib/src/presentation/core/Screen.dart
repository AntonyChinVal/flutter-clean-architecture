import 'package:flutter/material.dart';

/*
 * Screen
 */
abstract class Screen {
  String getName() {
    return "Screen";
  }

  Icon getIcon() {
    return Icon(Icons.home);
  }
}

/*
 *  StatefulScreen
 */
abstract class StatefulScreen extends StatefulWidget with Screen {
  StatefulScreen({Key? key}) : super(key: key);
}

/*
 *  ScreenState
 */
abstract class ScreenState<S extends StatefulScreen> extends State<S> {
  final GlobalKey<State<StatefulWidget>> globalKey =
      GlobalKey<State<StatefulWidget>>();

  Widget buildTemplate();

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

/*
 *  StatelessScreen
 */
abstract class StatelessScreen extends StatelessWidget with Screen {
  const StatelessScreen({Key? key}) : super(key: key);

  Widget buildTemplate();

  @override
  Widget build(BuildContext context) {
    return this.buildTemplate();
  }
}
