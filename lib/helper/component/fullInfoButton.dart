

import 'package:flutter/material.dart';

import '../constant/constant.dart';

class FullInfoButton extends StatelessWidget {
  const FullInfoButton({Key? key, required this.text,
    required this.onTap,
    required this.mainAxisAlignment}) : super(key: key);
  final String text;
  final  Function() onTap;
  final MainAxisAlignment  mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
        child:Row(
        mainAxisAlignment: mainAxisAlignment,
        children:[
          Text(text,
              style:ksubTextStyle,
              textAlign: TextAlign.end, textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false)
          ),
          Icon(Icons.navigate_next,color:primary,size:28,)
        ]
    ));
  }
}
