import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:flutter/material.dart';

class MainTemplate extends StatelessWidget {

  final GlobalKey<State<StatefulWidget>>? globalKey;
  final int? selectedIndex;
  final List<Screen>? widgets;
  final Function(int)? onTapHandler;

  MainTemplate({@required this.globalKey, @required this.selectedIndex, @required this.widgets, @required this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body : SafeArea(
        child : widgets![selectedIndex!]
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: widgets!.map((e) => BottomNavigationBarItem(icon: e.getIcon(),label: e.getName())).toList(),
          onTap: this.onTapHandler!,
          currentIndex: this.selectedIndex!,
        ),
      );
  }
}