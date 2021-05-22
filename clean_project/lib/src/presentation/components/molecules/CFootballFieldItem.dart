import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:flutter/material.dart';

class CFootballFieldItem extends StatelessWidget {
  final Field? item;

  CFootballFieldItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          item!.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    item!.image!,
                    fit: BoxFit.cover,
                    height: 160,
                    width: 160,
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          Text(
            item!.name!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item!.name!,
            style: TextStyle(color: Color(0xFFC2C3C9), fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
