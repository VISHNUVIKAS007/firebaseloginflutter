import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> currentUser();
  Future<String> signIn(String email,String password);
  Future<String> createUser(String email,String password);
  Future<void> signOut();

}
class Auth implements BaseAuth{

  Future<String> signIn(String email, String password) {
    FirebaseUser user= await _firebaseAuth.signInWithEmailAndPassword(email:email, password: password)
    return user.uid;
  }
  Future<String> createUser(String email, String password) {
    FirebaseUser user= await _firebaseAuth.signInWithEmailAndPassword(email:email, password: password)
    return user.uid;
  }
  Future<String> currentUser() async{
    FirebaseUser user = await _firebaeAuth.currentUser();
    return user != null ? user.uid :null;
  }
  Future<String> signOut() async{
    return _firebaseAuth.signOut();
  }


}