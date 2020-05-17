import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';


class AuthFirebase {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  Future emailLogin({
    @required String email,
    @required String password,
  }) async {
    try{
      var authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  Future <String> emailSignUpWithEmail({
    @required String email,
    @required String password,
    }) async {
      try {
        var authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        return authResult.user.uid;
      } catch(e) {
        return e.message;
      }
  }

  Future currentUser() async {
      try {
        var user = await firebaseAuth.currentUser();
        return user != null ? user.uid:null;
      } catch(e) {
        return e.message;
      }
  }

  Future <void> signOut () async{
    return firebaseAuth.signOut();
  }
}