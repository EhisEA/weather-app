import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:qiqi_farms/locator.dart';
import 'package:qiqi_farms/models/user_model.dart';
import 'package:qiqi_farms/services/firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = UserModel(
        id: authResult.user.uid,
        email: email,
      );

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  logOut() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      await _firebaseAuth.signOut();
      _prefs.clear();
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }
}
