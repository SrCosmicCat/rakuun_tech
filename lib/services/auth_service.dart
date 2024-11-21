import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

 // log  in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

 // sign up
Future<UserCredential> signUpwithEmailPassword(String email, password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
}
 // log out
 Future<void> signOut() async {
  return await auth.signOut();
 }
}