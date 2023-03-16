
import 'package:EasyElectic/presentations/onboarding/signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helper/component/materialButton.dart';
import '../../helper/component/textfeildinput.dart';
import '../../helper/constant/constant.dart';
import '../mainScreens/mainScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static final route = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
//todo:firebase login
class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;

  late TextEditingController passwordController;
    FirebaseAuth _auth=FirebaseAuth.instance;
   String ?  emailHelperText;
   String ? passwordHelperText;
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen(
        (user){

        }
    );
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  void dispose() {
     passwordController.dispose();
     emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              design,
              Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: ksubTitleTextStyle,
                    ),
                    KTextFieldInput(
                      top: 20,
                      bottom: 15,
                      prefixIcon: Icon(Icons.email_outlined),
                      controller: emailController,
                      errorText: emailHelperText,
                      textInputType: TextInputType.emailAddress,
                      labelText: 'Email',
                      onChange: (value) {
                        print(value);
                      },
                      onSumbmit: (value) {
                        print(value);
                      },
                    ),
                    KTextFieldInput(
                        bottom: 20,
                        controller: passwordController,
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: 'Password',
                        errorText: passwordHelperText,
                        textInputType: TextInputType.visiblePassword,
                        onChange: (value) {
                          print(value);
                        },
                        obscureText: true,
                        suffix: TextButton(
                          onPressed: () {},
                          child: Text('Show'),
                        )),
                    Text('Forget passcode? ', style: ksubTextStyle),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: MaterialTextButton(
                        minWidth:300,
                         widget: Text('Login'),
                        textColor: white,
                        color: primary,
                        onPressed: () {
                          signIn();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextButton(
                        child:Text( 'Create account',
                          style: ksubTextStyle,),
                        onPressed: ()
                        {
                           Navigator.pushNamed(context,SignupScreen.route);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  signIn()async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.pushNamedAndRemoveUntil(context,MainScreen.route,(f)=>false);
      }
      else{
         ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content:Text("Something is wrong"))
         );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text(e.toString()))
      );
      print(e);
    }
  }
  Stack design = Stack(
    children: [
      Container(
        height: 270,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(3),
            topRight: Radius.circular(3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Center(
            child: Text(
              'Welcome back',
              style: kTitleTextStyle,
              textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 20,
        child: Container(
          height: 70,
          width: 130,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  pink,
                  pinkOpacity,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
      ),
      Positioned(
        top: 20,
        left: 50,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: pillShadow,
              width: 6,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
      Positioned(
        right: 50,
        bottom: 40,
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: pillShadow,
              width: 6,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    ],
  );
}
