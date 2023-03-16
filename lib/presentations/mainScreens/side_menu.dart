import 'package:EasyElectic/helper/component/riveAssetsFiles/RiveUtils.dart';
import 'package:EasyElectic/helper/component/riveAssetsFiles/menu.dart';
import 'package:EasyElectic/helper/component/side_menu_tile.dart';
import 'package:EasyElectic/helper/constant/constant.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});
  static const route="/side_menu";
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Menu selectedSideMenu = sidebarMenus.first;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          width: 288,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: primary,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height:70,),
                ...sidebarMenus
                    .map((menu) => SideMenuTile(
                  menu: menu,
                  selectedMenu: selectedSideMenu,
                  press: () {
                    RiveUtils.chnageSMIBoolState(menu.rive.status!);
                    setState(() {
                      selectedSideMenu = menu;
                    });
                   // Navigator.pushNamed(context, MainScreen.route);
                  },
                  riveOnInit: (artboard) {
                    menu.rive.status = RiveUtils.getRiveInput(artboard,
                        stateMachineName: menu.rive.stateMachineName);
                  },
                ))
                    .toList(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                  child: TextButton(
                   onPressed: () {
                     //todo:signOut();
                   },
                   child:Row(
                     children: [
                       Icon(Icons.logout,color:white,),
                       SizedBox(width:5,),
                       Text( "Sign out".toUpperCase(),
                         style: Theme.of(context)
                             .textTheme
                             .titleMedium!
                             .copyWith(color: Colors.white70),),
                     ],
                   ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}


