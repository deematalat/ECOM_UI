



import 'package:flutter/material.dart';

import '../../helper/component/fullInfoButton.dart';
import '../../helper/component/materialButton.dart';
import '../../helper/component/productImageSlidwe.dart';
import '../../helper/constant/constant.dart';

class ProductDetailsScreen extends StatelessWidget {
  static final route='/ProductDetails';
  const ProductDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Hero(
        tag:1,
     child: SafeArea(child:
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
         Expanded(child:  ProductImageSlider(),),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  '2020 Apple iPad Air 10.9"',
                  style:kProductDetailsTitle,
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                ),
                SizedBox(height: 20,),
                Text("Colors",style:kProductTitleTextStyle),
                //todo:change to input button to get selected
                SizedBox(height: 20,),
                Row(
                  children:[
                MaterialTextButton(onPressed: () { }, minWidth:70,
                  textColor:darkPrimary,
                  widget:Row(
                    children: [
                      CircleAvatar(radius:8,backgroundColor:Colors.blue),
                      SizedBox(width:5,),
                      Text("blue")
                    ],
                  ),
                ),
                    SizedBox(width:10,),
                    MaterialTextButton(onPressed: () { }, minWidth:70,
                      textColor:darkPrimary,
                      widget:Row(
                        children: [
                          CircleAvatar(radius:8,backgroundColor:Colors.green),
                          SizedBox(width:5,),
                          Text("green")
                        ],
                      ),
                    ),
                    SizedBox(width:5,),
                    MaterialTextButton(onPressed: () { }, minWidth:70,
                      textColor:darkPrimary,
                      widget:Row(
                        children: [
                          CircleAvatar(radius:8,backgroundColor:Colors.pink),
                          SizedBox(width:10,),
                          Text("rose ")
                        ],
                      ),
                    ),
                  ]
                ),
                SizedBox(height: 30,),
                Text(
                  'Get Apple TV+ free for a year',
                  style: ksubTitleTextStyle,
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                ),
                Text(
                  'Available when you purchase any new iPhone, iPad, iPod Touch, Mac or Apple TV, £4.99/month after free trial.',
                  style:kProductDisTextStyle ,
                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                ),
                SizedBox(height:5,),
                FullInfoButton(onTap: () {}, text:'full description',
                  mainAxisAlignment:MainAxisAlignment.start ,),
                SizedBox(height:5,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Total',style:ksubTitleTextStyle),
                  Text("price\$",style:kProductPriceTextStyle,),

                ],),
                SizedBox(height:10,),
                Center(
                  child:
                MaterialTextButton(
                  //todo:add to card
                  onPressed: () {},
                  minWidth:300, textColor:white,
                  color:primary, widget:Text('Add to basket'),

                ),),
              ],
            ),
          )
        ],
      ),
     ),
    ),);
  }
}

