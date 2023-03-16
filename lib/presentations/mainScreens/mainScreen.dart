
import 'package:EasyElectic/presentations/mainScreens/navBarScreens/profilScreen.dart';
import 'package:EasyElectic/presentations/mainScreens/navBarScreens/shoppingBasket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import '../../helper/component/NB_Screens.dart';
import '../../helper/constant/constant.dart';
import 'navBarScreens/favScreen.dart';
import 'navBarScreens/homeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.ZrawerController}) : super(key: key);
  static final  route='/mainScreen';
  final ZrawerController;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex=0;
  List <NavigationButtonScreens> screens = <NavigationButtonScreens>
  [
         NavigationButtonScreens(title:'Home', body:HomeScreen()),
        const NavigationButtonScreens(title:'Favorite', body:FavScreen()),
        const NavigationButtonScreens(title:'Profile', body:ProfilScreen()),
       const  NavigationButtonScreens(title:'BasketCard', body:BasketCardScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:BottomNavigationBar(

        elevation: 0,
        items: [
          const BottomNavigationBarItem(
            icon:Icon(Icons.home_outlined),
            activeIcon:Icon(Icons.home_filled),
            label: 'Home',
          ),
          const  BottomNavigationBarItem(
              icon:Icon(Icons.favorite_border),
              activeIcon:Icon(Icons.favorite),
              label: 'Favorite'
          ),
          const  BottomNavigationBarItem(
              icon:Icon(Icons.person_outlined),
              activeIcon:Icon(Icons.person),
              label: 'Profile'
          ),
          const BottomNavigationBarItem(
              icon:Icon(Icons.shopping_cart_outlined),
              activeIcon:Icon(Icons.shopping_cart),
              label: 'Card'
          ),
        ],
        onTap:(index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        selectedFontSize:14,
        unselectedFontSize:12,
        selectedItemColor:primary,
        unselectedItemColor:darkPrimary,
      ),
            body: Stack(children: [
              screens[currentIndex].body ,
              if (currentIndex==0) Positioned(
              top:88,
               left:5,
              child:IconButton(onPressed: (){
               widget.ZrawerController.toggle?.call();
                setState(() {
                    print("toggle");
                });
              }, icon:Icon(Icons.menu_outlined)),)
            ],),


    );
  }
}


// if i wanna safe the current size for item card but resizeToAvoidBottomInset: false, to scaffold