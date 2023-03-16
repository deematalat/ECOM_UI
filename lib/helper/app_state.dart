import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

enum ApplicationLoginState{
 logout,
login
}
class ApplicationState extends ChangeNotifier{
  final _auth= FirebaseAuth.instance;
    User ? user;
    ApplicationLoginState loginState=ApplicationLoginState.logout;
  ApplicationState() {
    init();
  }
    Future<void> init()async
    {
      _auth.userChanges().listen((userFir){
          if(userFir!=null){
              loginState=ApplicationLoginState.login;
              user=userFir;
          }else{
            loginState=ApplicationLoginState.logout;
          }
          notifyListeners();
        });
    }
    Future<void>  signIn(String email, String password,void Function(FirebaseAuthException e) errorCallback)async
    {
        try{
          await _auth.signInWithEmailAndPassword(email: email, password: password);
        } on  FirebaseAuthException catch(e){
          errorCallback(e);
        }
    }

  Future<void>  signUp(String email, String password,void Function(FirebaseAuthException e) errorCallback)async
  {
    try{
     UserCredential userCredentials=
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on  FirebaseAuthException catch(e){
      errorCallback(e);
    }
  }
 void signOut()async{
    await _auth.signOut();
 }
}