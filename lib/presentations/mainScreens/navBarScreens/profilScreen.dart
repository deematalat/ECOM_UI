
import 'package:flutter/material.dart';

import '../../../helper/constant/constant.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child:
        SingleChildScrollView(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height:30,),
        Padding(padding: EdgeInsets.all(40) ,
       child: Column(
          children: [
       Card(elevation:3,
         shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.all(Radius.circular(20.0))),
         child:    Container(
           height: 200,
           width:double.infinity,
           child:Stack(
             clipBehavior:Clip.none,
           children: <Widget>[
             Positioned(
                 bottom:130 ,
                 right:120,
                 child:
                 CircleAvatar(
                   radius:50,
                   child:Image.asset('assets/images/onBorading.png'),
                 )),
             Positioned(
               bottom:110 ,
               right:150,
               child: Text('Name',style: ksubTitleTextStyle,),),
              Positioned(
             bottom:80 ,
             right:145,
             //todo:gelocater
             child:   Text('Address',style: noStateSubTitle,),)
           ]
       ),
         ),
       ),

            profileCard( title:'Edit Profile', onPressed: () {  },),
            profileCard( title:'Shoping address', onPressed: () {  },),
            profileCard( title:'Order history', onPressed: () {},),
            profileCard( title:'Cards', onPressed: () {  },),
            profileCard( title:'Notifications', onPressed: () {  },),

          ],
        ),)
      ],
    ),),
    );
  }
}

class profileCard extends StatelessWidget {
  const profileCard({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final Function()onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top:3,
      ),
        child:Card(elevation:2,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child:    Container(
          height: 70,
          width:double.infinity,
        child: Padding(
          padding:EdgeInsets.symmetric(
            horizontal:20
          ),
       child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Text(title,style:ksubTitleTextStyle,),
         IconButton(
            onPressed:onPressed,
            icon:Icon(Icons.navigate_next,size:30,)
          ),
        ],
        ),),
      ),)
    );
  }
}
