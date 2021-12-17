import 'package:flutter/material.dart';

class TopicItem extends StatelessWidget {
  final String title;

  const TopicItem({this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Text(this.title),
      alignment: Alignment.center,
    );
  }
}
