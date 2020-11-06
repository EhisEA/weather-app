import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/models/user_model.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

  manage(e) {
    if (e is PlatformException) {
      return e.message;
    }

    return e.toString();
  }

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      manage(e);
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return UserModel.fromJson(userData.data);
    } catch (e) {
      manage(e);
    }
  }
}
