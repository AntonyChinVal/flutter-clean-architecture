import 'package:flutter/material.dart';

class CustomGridView<T> extends StatelessWidget {
  final List<T> items;
  final int count;
  final Widget Function(T) builder;

  const CustomGridView(
      {Key? key, required this.items, required this.builder, this.count = 2})
      : super(key: key);

  List<Widget> convertItemsToWidgets() {
    List<Widget> widgets = items.map((element) => builder(element)).toList();
    return widgets;
  }

  List<List<Widget>> getDividedWidgets(List<Widget> widgets) {
    List<List<Widget>> dividedWidgets = [];
    for (var i = 0; i < widgets.length; i += count) {
      try {
        dividedWidgets.add(widgets.sublist(i, i + count).toList());
      } catch (ex) {
        dividedWidgets.add(widgets.sublist(i, widgets.length).toList());
      }
    }
    return dividedWidgets;
  }

  List<Widget> getDividedRows() {
    List<Widget> dividedRows = [];
    if (items.isNotEmpty) {
      List<Widget> widgets = convertItemsToWidgets();
      List<List<Widget>> dividedWidgets = getDividedWidgets(widgets);
      dividedRows = dividedWidgets
          .map((divideWidget) => Row(
                children: divideWidget
                    .map((widget) => Expanded(
                          child: widget,
                        ))
                    .toList(),
              ))
          .toList();
    }
    return dividedRows;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> builderItems = getDividedRows();
    return ListView.builder(
      itemCount: builderItems.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return builderItems[index];
      },
    );
  }
}
