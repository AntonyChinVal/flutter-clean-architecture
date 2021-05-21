import 'package:flutter/material.dart';

class CTitle extends StatelessWidget {
  final String text;

  const CTitle({this.text = 'Title'});

  @override
  Widget build(BuildContext context) {
    print("Build CTitle");
    return Container(
        width: double.infinity,
        child: Text.rich(TextSpan(
            text: this.text,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ))));
  }
}
