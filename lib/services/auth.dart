import 'package:cafe_curator/model/my_user.dart';
import 'package:cafe_curator/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create MyUser object from (Firebase) User
  MyUser? _getMyUserFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get myUser {
    // return _auth.authStateChanges().map((User? user) => _getMyUserFromFirebaseUser(user));
    return _auth.authStateChanges().map(_getMyUserFromFirebaseUser);
  }

  // Anonymous sign-in
  Future anonymousSignIn() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _getMyUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign-in with e-mail & password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _getMyUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with e-mail & password
  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // Create a new document for the registered user
      await DatabaseService(uid: user!.uid).updateUserData('New member', '0', 100);
      return _getMyUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}