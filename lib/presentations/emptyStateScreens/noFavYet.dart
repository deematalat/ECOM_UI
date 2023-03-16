

 import 'package:flutter/material.dart';

import '../../helper/component/materialButton.dart';
import '../../helper/constant/constant.dart';

class EmptyFavorite extends StatelessWidget {
   const EmptyFavorite({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return  SafeArea(
       child: Column(
         mainAxisAlignment:MainAxisAlignment.start,
         crossAxisAlignment:CrossAxisAlignment.center,
         children: [
           SizedBox(height:30,),
            Row(children: [
              IconButton(
                onPressed: () {Navigator.of(context).pop();},
                icon:Icon(Icons.navigate_before,size:30,color:darkPrimary,),

              ),
              SizedBox(width:115,),
              Text(
                'Favorites',
                style:ksubTitleTextStyle,
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ],
           ),
           Container(
                margin:EdgeInsets.symmetric(
                  horizontal:30,
                ),
          child: Image.asset('assets/images/noFav.png',fit:BoxFit.cover,),),
           Text(
             'No favorites yet',
             style: kProductDetailsTitle,
             textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
             textAlign: TextAlign.center,
           ),
           SizedBox(height:10,),
           Text(
             'Hit the button down\nbelow to Create an order',
             style:noStateSubTitle,
             textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
             textAlign: TextAlign.center,
           ),
           SizedBox(height:10,),
           MaterialTextButton(
             onPressed: () {  },
             color:buttonGreen ,
             textColor:white,
             minWidth: 200,
             widget:Text('Start ordering'),
           ),
         ],
       ),
     );
   }
 }
