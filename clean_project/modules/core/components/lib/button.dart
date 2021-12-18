import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool enabled;
  final String title;
  final Color color;
  final Function? onPressed;

  const Button(
      {Key? key,
      this.enabled = true,
      this.title = '',
      this.color = Colors.red,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      autofocus: false,
      style: ElevatedButton.styleFrom(
          primary: enabled ? color : color.withOpacity(0.50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ))
          ],
        ),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
    );
  }
}
