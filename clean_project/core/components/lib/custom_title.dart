import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;

  const CustomTitle({this.text = 'Title'});

  @override
  Widget build(BuildContext context) {
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
