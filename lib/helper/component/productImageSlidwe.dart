

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({Key? key}) : super(key: key);

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  late PageController pageController;
  late int pageIndex=0;
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
  List slider = [
    Image.asset('assets/images/images.jpg',fit:BoxFit.cover,),
    Image.asset('assets/images/images.jpg',fit:BoxFit.cover,),
    Image.asset('assets/images/images.jpg',fit:BoxFit.cover,),
  ];
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:
      [
        PageView.builder(
          controller:pageController,
          itemCount:slider.length,
            itemBuilder: (context,index)=>slider[index],
          onPageChanged: ( index){
            setState((){
              pageIndex=index;
            });

          },
        ),
        ListTile(
          trailing:IconButton(
          onPressed: () {  },//todo:add to fav list
          icon:Icon(Icons.favorite_border,size:30,color:darkPrimary,),),
            leading:IconButton(
              onPressed: () {
            Navigator.of(context).pop();
              },
              icon:Icon(Icons.navigate_before,size:30,color:darkPrimary,),),
        ),
        Positioned(
         bottom:20,
           left:175,
           child:
           Row(
         children: [
           buildDot(0,context,pageIndex),
           buildDot(1,context,pageIndex),
           buildDot(2,context,pageIndex),
         ],
       ),
       ),
      ],
    );
  }
}
Container buildDot(int index, BuildContext context,int currentIndex){
  return Container(
    height: 10,
    width: currentIndex == index ? 25 : 10,
    margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: primary,
    ),
  );
}


