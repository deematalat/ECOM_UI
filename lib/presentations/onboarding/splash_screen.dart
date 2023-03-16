
import 'package:EasyElectic/presentations/enteryScreen.dart';
import 'package:EasyElectic/presentations/mainScreens/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../../helper/component/materialButton.dart';
import '../../helper/constant/constant.dart';
import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
   static final route='/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    _auth.authStateChanges().listen(( user)
    {
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primary,
      body: SafeArea(child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(flex:1,),
           Text('Find your\nGadget',
             textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
             style:kTitleTextStyle,
           ),
          Container(
            height:500,
            width:500,
            decoration:BoxDecoration(
              color:primary,
                backgroundBlendMode:BlendMode.lighten,
             image: DecorationImage(
                 image: AssetImage('assets/images/onBorading.png'),
             ),
            ),
          ),
          MaterialTextButton(
            minWidth: 300,
             widget: Text('Get Started'),
            textColor: primary,
            onPressed:() {
              Navigator.pushNamed(context,
                   _auth.currentUser==null?
                  LoginScreen.route :DrawerZoom.route
              );
            },
          ),

          Spacer(flex:2,),
           ],
      ),//columan
      ),//safe area
    );
  }
}


