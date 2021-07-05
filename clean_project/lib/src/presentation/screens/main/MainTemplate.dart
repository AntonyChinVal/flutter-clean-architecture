import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:flutter/material.dart';

class MainTemplate extends StatelessWidget {
  final int? selectedIndex;
  final List<Widget>? widgets;
  final Function(int)? onTapHandler;

  MainTemplate(
      {@required this.selectedIndex,
      @required this.widgets,
      @required this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return widgets != null && widgets!.isNotEmpty
        ? Scaffold(
            body: SafeArea(child: widgets![selectedIndex!]),
            bottomNavigationBar: BottomNavigationBar(
              items: widgets!.map((e) {
                var screen = e as Screen;
                return BottomNavigationBarItem(
                    icon: screen.getIcon(), label: screen.getName());
              }).toList(),
              onTap: this.onTapHandler!,
              currentIndex: this.selectedIndex!,
            ),
          )
        : Text("No Childs");
  }
}
