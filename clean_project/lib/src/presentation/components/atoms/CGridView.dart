import 'package:flutter/material.dart';
class CGridView<T> extends StatelessWidget {

  final List<T>? items;
  final int count;
  final Widget Function(T)? builder;

  CGridView({@required this.items, @required this.builder ,this.count = 2});

  List<Widget> convertItemsToWidgets(){
    List<Widget> widgets = this.items!.map((element) => this.builder!(element)).toList();
    return widgets;
  }

  List<List<Widget>> getDividedWidgets(List<Widget> widgets) {
    List<List<Widget>> dividedWidgets = [];
    for (var i = 0; i < widgets.length; i += this.count) {
      try{
        dividedWidgets.add(widgets.sublist(i, i+this.count).toList());  
      }catch(ex){
        dividedWidgets.add(widgets.sublist(i, widgets.length).toList());  
      }
    }    
    return dividedWidgets;
  }

  List<Widget> getDividedRows(){
    List<Widget> dividedRows = [];
    if(this.items!.isNotEmpty){
      List<Widget> widgets = this.convertItemsToWidgets();
      List<List<Widget>> dividedWidgets = getDividedWidgets(widgets);
      dividedRows = dividedWidgets.map( (divideWidget) =>
        Row(
          children: divideWidget.map((widget)=>
            Expanded(
              child: widget,
            )
          ).toList(),
        )
      ).toList();
    }
    return dividedRows;
  }
  
  @override
  Widget build(BuildContext context) {
    List<Widget> builderItems = this.getDividedRows();
    return ListView.builder(
      itemCount: builderItems.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return builderItems[index];
        },
    );
  }

}