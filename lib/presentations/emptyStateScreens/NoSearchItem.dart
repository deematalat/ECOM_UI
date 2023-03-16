
import 'package:flutter/material.dart';

import '../../helper/component/Search_Field.dart';
import '../../helper/constant/constant.dart';

class NoAvilableItem extends StatelessWidget {
  const NoAvilableItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              SizedBox(height:20,),
               Row( crossAxisAlignment:CrossAxisAlignment.center,
                 children: [
          IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon:Icon(Icons.navigate_before,size:30,color:darkPrimary,
          ),
            ),
                 SizedBox(width:10,),
                 SearchField(onPresses: () {}, onTap: () {  },),
               ],
              ),
              SizedBox(height:40,),
              Container(
                margin:EdgeInsets.symmetric(
                   horizontal:20,
                ),
                child:Center(child: Image.asset('assets/images/noItem.png',
                  fit:BoxFit.cover,),
                ),
              ),
              SizedBox(height:10,),
              Column(
                children: [
                  Text(
                    'Item not found',
                    style: kProductDetailsTitle,
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height:10,),
                  Text(
    'Try a more generic search term or try looking for alternative products.',
                    style:noStateSubTitle,
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height:10,),
                ],
              ),
            ],
          ),
      ),

    );
  }
}
