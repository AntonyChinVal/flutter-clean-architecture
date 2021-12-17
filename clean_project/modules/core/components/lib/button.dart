import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool enabled;
  final String title;
  final Color color;
  final Function? onPressed;

  const Button(
      {this.enabled = true,
      this.title = '',
      this.color = Colors.red,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: false,
      style: ElevatedButton.styleFrom(
          primary: this.enabled ? this.color : this.color.withOpacity(0.50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(this.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ))
          ],
        ),
      ),
      onPressed: () {
        if (this.onPressed != null) {
          onPressed!();
        }
      },
    );
  }
}
