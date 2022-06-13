import 'package:flutter/material.dart';
import 'package:ui/theme/fonts.dart';

class Button extends StatelessWidget {
  final bool enabled;
  final String title;
  final Color color;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final Function()? onPressed;
  final List<BoxShadow>? boxShadow;

  const Button(
      {Key? key,
      this.enabled = true,
      this.title = '',
      this.color = Colors.black,
      this.onPressed,
      this.width,
      this.margin,
      this.boxShadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), boxShadow: boxShadow),
      child: ElevatedButton(
        autofocus: false,
        style: ElevatedButton.styleFrom(
                primary: color,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))
            .copyWith(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return color;
              } else if (states.contains(MaterialState.disabled)) {
                return color.withOpacity(0.8);
              }
              return color;
            },
          ),
        ),
        onPressed: enabled ? onPressed : null,
        child: Container(
          color: Colors.transparent,
          child: Text(
            title,
            style: Fonts.button1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
