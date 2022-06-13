import 'package:flutter/material.dart';

class TopicItem extends StatelessWidget {
  final String title;

  const TopicItem({Key? key, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
