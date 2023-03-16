import 'package:flutter/material.dart';
import '../../presentations/products_Screens/productDetails.dart';
import '../constant/constant.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productDescription,
      required this.productPrice, required this.itemTag,

      })
      : super(key: key);
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  final int itemTag;
  @override
  Widget build(BuildContext context) {
    return
     Hero(tag:itemTag, child: Center(
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.elliptical(20.0, 20.0)),
          splashColor: Colors.white,
          onTap: () {
             Navigator.pushNamed(context,ProductDetailsScreen.route);
          },
          child: SizedBox(
            width: 200,
            height: 255,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: const Alignment(-0.9,-4),
                  child: Image(image: AssetImage(productImage),fit:BoxFit.cover,),
                ),
                  Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SizedBox(height:40,),
                       Center(
                         child: Text(
                           productName,
                           style: TextStyle(
                               fontSize: 22.0,
                               fontWeight: FontWeight.w600,
                               fontFamily: 'Raleway'),
                         ),
                       ), Center(
                         child: Text(
                           productDescription,
                           style:
                           TextStyle(color: Color(0xff868686), fontSize: 16.0),
                         ),
                       ),
                     ],
                   ),
                Padding(
                  padding: EdgeInsets.only(top: 138.0, bottom: 31.0,
                  ),
                  child: Center(
                    child: Text(
                      productPrice,
                      style:
                      TextStyle(color: Color(0xff5956E9), fontSize: 17.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),),
      ),
    );
  }
}
/*class GridViewItem extends StatelessWidget {
  const GridViewItem(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productDescription,
      required this.productPrice})
      : super(key: key);
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  @override
  Widget build(BuildContext context) {
    //Todo:Product image

    return Hero(
      tag:1,
     child: GestureDetector(
       child: Card(
      elevation: 10,
      shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(10)
      ),
      color: Colors.white,
      child:
        Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
            ,
        ],
      ),
    ),),
            );
  }
}*/
/*Column(
              children: [
                SizedBox(height: 100,),
                Text(
                  productName,
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                  ),
                  textAlign: TextAlign.center,
                  style: kProductTitleTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  productDescription,
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  style: kProductDisTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  productPrice,
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  style: kProductPriceTextStyle,
                ),
],)*/
