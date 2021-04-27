
import 'package:clean_project/src/presentation/components/atoms/CGridView.dart';
import 'package:clean_project/src/presentation/components/molecules/CFootballFieldItem.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:flutter/material.dart';
class CFootballFieldList extends StatelessWidget {

  final List<Field> items;

  CFootballFieldList({this.items = const []});

  @override
  Widget build(BuildContext context) {
    return CGridView<Field>(items: this.items, count: 2, builder: (item) => CFootballFieldItem(item: item,));
  }

}