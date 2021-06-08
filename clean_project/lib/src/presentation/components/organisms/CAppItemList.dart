import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:clean_project/src/presentation/components/atoms/CGridView.dart';
import 'package:clean_project/src/presentation/components/molecules/CAppItem.dart';
import 'package:flutter/material.dart';

class CAppItemList extends StatelessWidget {
  final List<AppItem> items;

  CAppItemList({this.items = const []});

  @override
  Widget build(BuildContext context) {
    return CGridView<AppItem>(
        items: this.items,
        count: 2,
        builder: (item) => CAppItem(
              item: item,
            ));
  }
}
