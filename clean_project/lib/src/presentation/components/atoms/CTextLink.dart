import 'package:flutter/material.dart';

class CTextLink extends StatelessWidget {
  final String title;
  final String? linkTitle;
  final Color color;
  final Function? onPressed;
  final MainAxisAlignment alignment;

  const CTextLink(
      {@required this.onPressed,
      @required this.linkTitle,
      this.title = '',
      this.color = Colors.red,
      this.alignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: this.alignment,
          children: <Widget>[
            Text(this.title == '' ? '' : this.title + ' ',
                style: TextStyle(color: Colors.black, fontSize: 16)),
            InkWell(
              onTap: () {
                this.onPressed!();
              },
              child: Text(this.linkTitle!,
                  style: TextStyle(color: this.color, fontSize: 16)),
            )
          ],
        ));
  }
}
