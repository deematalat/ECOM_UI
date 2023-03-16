




import 'package:EasyElectic/helper/constant/constant.dart';
import 'package:EasyElectic/presentations/mainScreens/mainScreen.dart';
import 'package:EasyElectic/presentations/mainScreens/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerZoom extends StatelessWidget {
    DrawerZoom({Key? key}) : super(key: key);
     static const route='/draw';
     final drawerZoomController=ZoomDrawerController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       body:ZoomDrawer(
         menuScreen:SideMenu(),
         controller:drawerZoomController,
        mainScreen: MainScreen(ZrawerController:drawerZoomController),
         //style:DrawerStyle.style1,
         borderRadius:24.0,
         showShadow:true,
         angle: 0.0,
         menuBackgroundColor:primary,
         slideWidth: MediaQuery.of(context).size.width*0.65,
         openCurve: Curves.fastOutSlowIn,
         closeCurve: Curves.bounceIn,


       ) ,
     );
   }
 }
