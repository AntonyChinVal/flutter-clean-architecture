import 'package:flutter/material.dart';

class CProgressModal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async => false,
      child: 
        Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          child: new Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
          ],
        ),
        ),
      )
      );
  }
}