import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;

  const CustomTitle({Key? key, this.text = 'Title'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: text,
              style: const TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
