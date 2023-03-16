

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../helper/component/gridViewItem.dart';
import '../../helper/constant/constant.dart';
import 'ProductsSlider.dart';

class PageViewScreen extends StatefulWidget {
  PageViewScreen({Key? key,}) : super(key: key);
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
 late PageController pageController;
 int pageIndex=0;
 bool isSelected=false;
 @override
  void initState() {
    super.initState();
    pageController=PageController(initialPage:0);
  }
  @override
  void dispose() {
     pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children:[
        //TODO:row as listViewBulider
        //TODO:textButton as Component
        Row(
          children: [
            TextButton(onPressed:(){
              setState(() {
                 pageController.animateToPage(0,
                     duration:Duration(microseconds:10000), curve:Curves.easeInOut);
               });
            },
                child: Text('Wearable',
                  style:pageIndex==0?ksubTextStyle:kProductDisTextStyle,
                ),
            ),
            TextButton(onPressed:(){
              setState(() {
                pageController.animateToPage(1,
                    duration:Duration(microseconds:6000), curve:Curves.easeInOut);
              });
            },
              child: Text('phones',
                style: pageIndex==1?ksubTextStyle:kProductDisTextStyle,
              ),
            ),
            TextButton(onPressed:(){
              pageController.animateToPage(2,
                  duration:Duration( microseconds:6000), curve:Curves.easeInOut);
            setState(() {

              });
            },
              child: Text('laptops',
                style:pageIndex==2?ksubTextStyle:kProductDisTextStyle,
              ),
            ),
          ],
        ),
      SizedBox(height:30,),
      Expanded(child:
      PageView(
        controller:pageController,
             scrollDirection:Axis.horizontal,
      onPageChanged:(Index){
          setState(() {
            pageIndex= Index;
          });
                   },
             children:
             [
               ProductSlider(

                 title: 'Wearable',
                 itemBuilder: GridViewItem(
                   productPrice: '399\$',
                   productDescription:'Product description',
                   productName: '  product name',
                   productImage:'assets/images/cut.png', itemTag:pageIndex,
                 ),
                 itemCount:5,),
               ProductSlider(title: 'phones',
                 itemBuilder: GridViewItem(
                   itemTag:pageIndex,
                   productPrice: '400\$',
                   productDescription:'Product description',
                   productName: '  product name',
                   productImage:'assets/images/onBorading.png',
                 ),
                 itemCount:5,),
               ProductSlider(
                 title: 'laptops',
                 itemBuilder: GridViewItem(
                   productPrice: '500',
                   productDescription:'Product description',
                   productName: '  product name',
                   productImage:'assets/images/onBorading.png', itemTag:pageIndex,
                 ),
                 itemCount:5,),

             ],

    ),),
    ]
    );
  }
}
