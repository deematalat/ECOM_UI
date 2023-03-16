
import 'package:flutter/material.dart';

class MaterialTextButton extends StatelessWidget {
  const MaterialTextButton({Key? key, required this.onPressed,
     this.color,
    required this.textColor, required this.minWidth, required this.widget}) : super(key: key);
    final Function() onPressed;
    final Color textColor;
    final  Widget  widget;
    final Color ? color;
    final double minWidth;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation:8,
      color: color,
      borderRadius: BorderRadius.circular(15.0),
      child:MaterialButton(
        minWidth:minWidth,
        height: 42.0,
        onPressed:onPressed ,
        child:widget,
        textColor:  textColor,
      ),
    );
  }
}
