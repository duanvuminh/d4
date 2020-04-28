import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signInWithName(AuthCredential authCreds,name) {
    FirebaseAuth.instance
    .signInWithCredential(authCreds)
    .then((onValue){
      
    });
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance
    .signInWithCredential(authCreds)
    .then((onValue){
      
    });
  }

  signInWithOTP(smsCode, verId, name) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signInWithName(authCreds,name);
  }
}
