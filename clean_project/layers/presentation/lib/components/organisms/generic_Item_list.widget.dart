import 'package:domain/model/generic_item/generic_item.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_grid_view.dart';
import 'package:presentation/components/molecules/generic_item.widget.dart';

class GenericItemListWidget extends StatelessWidget {
  final List<GenericItem> items;

  GenericItemListWidget({this.items = const []});

  @override
  Widget build(BuildContext context) {
    return CustomGridView<GenericItem>(
        items: this.items,
        count: 2,
        builder: (item) => GenericItemWidget(
              item: item,
            ));
  }
}
