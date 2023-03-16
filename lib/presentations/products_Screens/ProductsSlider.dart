

import 'package:flutter/cupertino.dart';

import '../../helper/component/gridViewItem.dart';

class  ProductSlider extends StatelessWidget {
  const ProductSlider({Key? key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder}) : super(key: key);
   final String title;
   final int itemCount;
   final Widget itemBuilder;
  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount:itemCount,
      itemBuilder: (context,index)=>
          Container(margin:EdgeInsets.symmetric(
            horizontal:15,
          ),
              child:itemBuilder)
    );
  }
}
/* GridViewItem(productPrice: '399\$',
            productDescription:'Product description',
            productName: '  product name',
            productImage:'assets/images/onBorading.png',
          ),*/