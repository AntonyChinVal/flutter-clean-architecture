
import 'package:clean_project/src/presentation/components/atoms/CSearchField.dart';
import 'package:clean_project/src/presentation/components/atoms/CTitle.dart';
import 'package:clean_project/src/presentation/components/organisms/CFootballFieldList.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:clean_project/src/presentation/components/organisms/CProgressModal.dart';
import 'package:flutter/material.dart';

class FieldListTemplate extends StatelessWidget {

  final bool inAsyncCall;
  final GlobalKey<State<StatefulWidget>>? globalKey;
  final List<Field>? fields;
  final TextEditingController? searchController;

  FieldListTemplate({
    @required this.globalKey,
    @required this.fields,
    @required this.searchController,
    this.inAsyncCall = true
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body : SafeArea(
        child : Column(
           children: <Widget>[
             Container(
              color: Color(0xFFF1F2F6),
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                SizedBox(height: 20,),
                CTitle(text: 
                "¿Qué estás\n\n"
                "buscando hoy?"
                ),
                SizedBox(height: 10,),
                CSearchField(controller:  this.searchController,),
                SizedBox(height: 20,),
                ],
              ),
            ),
            SizedBox(height: 30,),
            this.inAsyncCall ? CProgressModal() : SizedBox(),
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: Text('Canchas Disponibles',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),
              ),
            ),
            SizedBox(height: 30,),
            Flexible(
              child: CFootballFieldList(items : this.fields!)
            )
           ],
        )
        
      )
      );
  }

  

}