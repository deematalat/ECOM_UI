
import 'package:flutter/material.dart';

import '../constant/constant.dart';
class  KTextFieldInput extends StatelessWidget {
   KTextFieldInput ({Key? key, required this.controller,  this.onChange,
    this.onSumbmit, required this.textInputType, required this.labelText,
     this.helperText, required this.prefixIcon, this.errorText,
   this.obscureText=false, this.top=0,  this.bottom=0, this.suffix}) : super(key: key);
 final TextEditingController controller ;
 final Function(String) ? onChange;
  final Function(String) ? onSumbmit;
  final TextInputType textInputType ;
  final bool  obscureText;
  final String labelText;
  final String ? helperText;
  final Widget prefixIcon;
 final String ? errorText;
 final double top;
 final double bottom;
 final  Widget ?  suffix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left:0 ,right:0,
        top:top ,bottom:bottom ,
      ),
      child:  TextField(
        obscuringCharacter:'*',
        scrollPhysics:ScrollPhysics(),
        onChanged:onChange,
        onSubmitted:(value){print(value);} ,
        controller: controller ,
        keyboardType: textInputType,
        obscureText: obscureText ,
        cursorColor:darkPrimary,
        decoration: InputDecoration(
          suffix: suffix,
          counterText:'',
          labelText:  labelText,
          prefixIcon:prefixIcon,
          helperText:helperText,
          errorText: errorText,
          labelStyle:TextStyle(),
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          focusColor:primary,
        ),
      ),
    );
  }
}



