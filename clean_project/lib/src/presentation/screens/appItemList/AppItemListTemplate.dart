import 'package:clean_project/src/presentation/components/atoms/CSearchField.dart';
import 'package:clean_project/src/presentation/components/atoms/CTitle.dart';
import 'package:clean_project/src/presentation/components/organisms/CAppItemList.dart';
import 'package:clean_project/src/presentation/components/organisms/CProgressModal.dart';
import 'package:clean_project/src/presentation/screens/appItemList/AppItemListNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppItemListTemplate extends StatelessWidget {
  final TextEditingController? searchController;

  AppItemListTemplate({@required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Container(
          color: Color(0xFFF1F2F6),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              const CTitle(
                  text: "¿Qué estás\n\n"
                      "buscando hoy?"),
              SizedBox(
                height: 10,
              ),
              CSearchField(
                controller: this.searchController,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        context.watch<AppItemListNotifier>().inAsyncCall
            ? CProgressModal()
            : SizedBox(),
        Container(
          padding: EdgeInsets.only(left: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            'Canchas Disponibles',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Flexible(
            child: CAppItemList(
                items: context.watch<AppItemListNotifier>().appItems))
      ],
    )));
  }
}
