

import 'package:flutter/material.dart';

import '../constant/constant.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key, required this.onPresses,
     required this.onTap}) : super(key: key);
  final Function() onPresses;
  final Function() onTap ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:50,
      width:300,
      child:TextField(
        keyboardType:TextInputType.text,
        onTap:onTap ,
        decoration:InputDecoration(
          hintText:'Search',
          prefixIcon:IconButton(icon:Icon(Icons.search,color:darkPrimary),
            onPressed:onPresses,),
          border:const OutlineInputBorder
            (
              borderRadius:BorderRadius.all(Radius.circular(30))
          ),
        ),
      ),
    );
  }
}
