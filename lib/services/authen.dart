import 'package:firebase_auth/firebase_auth.dart';
class AuthService {
  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  Future<AuthResult> signIn(AuthCredential authCreds) {
    return FirebaseAuth.instance
    .signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
     return signIn(authCreds);
  }
}
