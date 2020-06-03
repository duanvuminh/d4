import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  Firestore _store;
  String _handset;
  Status _status = Status.Uninitialized;

  UserRepository() {
    _auth = FirebaseAuth.instance;
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
    _store = Firestore.instance;
  }

  Status get status => _status;
  FirebaseUser get user => _user;

  void setHandset(String phone) {
    if (phone.isNotEmpty) {
      _handset = phone;
    }
  }

  //SignIn
  Future<AuthResult> signIn(AuthCredential authCreds) {
    return _auth.signInWithCredential(authCreds).then((auth) {
      _store.collection('Users').document(auth.user.uid).setData(
          {'logindate': DateTime.now(), 'handset': _handset},
          merge: true);
      return auth;
    });
  }

  Future<AuthResult> signInWithOTP(smsCode, verificationId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    return signIn(authCreds);
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _store.collection('Users').document(_user.uid).get().then((doc) {
        _handset = doc.data["handset"];
        return doc;
      });
    }
    notifyListeners();
  }
}
