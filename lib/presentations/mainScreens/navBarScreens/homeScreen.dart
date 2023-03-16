
import 'package:EasyElectic/presentations/mainScreens/searchResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../helper/component/Search_Field.dart';
import '../../../helper/component/fullInfoButton.dart';
import '../../../helper/constant/constant.dart';
import '../../products_Screens/pageView.dart';
import '../side_menu.dart';


class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:
      Padding(
        padding:EdgeInsets.all(20),
    child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          SizedBox(height: 20,),
          Row(
            children:
            [
              SizedBox(width:40),
              SearchField(onPresses: () {
                Navigator.pushNamed(context,SearchItemScreen.route); },
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(
            'Order online\ncollect in store',
            style:kMainScreenTextStyle,
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
          ),
          SizedBox(height: 20,),
          Expanded(
           child: PageViewScreen( ),
         ),

     FullInfoButton(onTap: () {}, text: 'see more'
            , mainAxisAlignment:MainAxisAlignment.end,

          ),
        ],
      ),)
    );
  }
}
