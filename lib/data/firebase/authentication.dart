import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  Future signIn({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }
}
