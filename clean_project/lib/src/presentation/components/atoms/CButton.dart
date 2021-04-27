import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CButton extends StatelessWidget {

  final String title;
  final Color color;
  final Function? onPressed;
  final SvgPicture? svgPicture;

  CButton({this.title = '',this.color = Colors.red, @required this.onPressed, this.svgPicture});

  @override
  Widget build(BuildContext context) {
    
    return  ElevatedButton(
        autofocus: false,
        style: TextButton.styleFrom(primary: this.color,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)
        ) ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Row(
            children: <Widget>[
              this.svgPicture != null ? this.svgPicture! : SizedBox(width: 0),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  alignment : Alignment.center,
                  child: Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                )
              )
              
            ],
          ),
        ),
      onPressed: (){
        onPressed!();
      },
      
    ) ;
  }

}