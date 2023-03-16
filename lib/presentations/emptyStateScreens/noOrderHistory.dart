

import 'package:flutter/material.dart';

import '../../helper/component/materialButton.dart';
import '../../helper/constant/constant.dart';

class NoOrderState extends StatelessWidget {
  const NoOrderState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
           Row(
             children: [
      IconButton(
      onPressed: () {Navigator.of(context).pop();},
      icon:Icon(Icons.navigate_before,size:30,color:darkPrimary,),

    ),           SizedBox(width:114 ,),
               Text(
                 'Order history',
                 style:ksubTitleTextStyle,
                 textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                 textAlign: TextAlign.center,
               ),
             ],
          ),
          Container(
            margin:EdgeInsets.all(30),
            child: Image.asset('assets/images/noHistory.png',fit:BoxFit.cover,),),
          Text(
            'No history yet',
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
