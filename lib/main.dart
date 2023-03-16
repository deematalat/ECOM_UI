
import 'package:EasyElectic/presentations/enteryScreen.dart';
import 'package:EasyElectic/presentations/mainScreens/mainScreen.dart';
import 'package:EasyElectic/presentations/mainScreens/searchResultScreen.dart';
import 'package:EasyElectic/presentations/mainScreens/navBarScreens/shoppingBasket.dart';
import 'package:EasyElectic/presentations/mainScreens/side_menu.dart';
import 'package:EasyElectic/presentations/onboarding/loginscreen.dart';
import 'package:EasyElectic/presentations/onboarding/signUpScreen.dart';
import 'package:EasyElectic/presentations/onboarding/splash_screen.dart';
import 'package:EasyElectic/presentations/products_Screens/productDetails.dart';
import 'package:firebase_core/firebase_core.dart'show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'firebase_options.dart';
import 'logicLayer/dataModel/products.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner:false,
      initialRoute: SplashScreen.route,
      routes:{
        SplashScreen.route:(context)=>SplashScreen(),
        LoginScreen.route:(context)=>LoginScreen(),
        MainScreen.route:(context)=> MainScreen(),
        ProductDetailsScreen.route:(context)=> ProductDetailsScreen(),
        SearchItemScreen.route:(context)=> SearchItemScreen(),
        BasketCardScreen.route:(context)=> BasketCardScreen(),
        SignupScreen.route:(context)=> SignupScreen(),
        SideMenu.route:(context)=> SideMenu(),
        DrawerZoom.route:(context)=> DrawerZoom(),
      },
    );
  }
}


