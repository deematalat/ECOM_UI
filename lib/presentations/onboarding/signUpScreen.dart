

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../helper/component/materialButton.dart';
import '../../helper/component/textfeildinput.dart';
import '../../helper/constant/constant.dart';
import '../enteryScreen.dart';
import '../mainScreens/mainScreen.dart';
import 'loginscreen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);
  static final route = '/signUp';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
//todo:firebase login
class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController emailController;

  late TextEditingController passwordController;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String ? emailHelperText;
  String ? passwordHelperText;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen(
            (user) {

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
                      'Sign up',
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
                    RichText(text:TextSpan(
                      text: '',
                      children: [
                        TextSpan(text:'have an account ?',style:ksubTitleTextStyle.copyWith(
                          color:Colors.black87,
                          fontWeight:FontWeight.normal
                        ) ),
                        TextSpan(text:' login',style:kProductPriceTextStyle,
                        recognizer:TapGestureRecognizer()..onTap = (){
                          Navigator.pushNamed(context, LoginScreen.route);
                        }
                        ),
                      ]
                    ),),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: MaterialTextButton(
                        minWidth: 300,
                        widget: Text('Sign up'),
                        textColor: white,
                        color: primary,
                        onPressed: () {
                          signUp();
                         // TODO:
                          if(_auth.currentUser!=null) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, DrawerZoom.route,
                                    (route) => false
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
    signUp() async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.pushNamedAndRemoveUntil(context,MainScreen.route,(f)=>false);
        print("done");
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("Something is wrong" ))
        );
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("The password provided is too weak."))
        );

      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text("The account already exists for that email."))
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text(e.toString()))
      );
    }
  }
}