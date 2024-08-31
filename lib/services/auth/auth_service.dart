import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instance of Path
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }
  // Sign in

  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _firestore.collection('Users').doc(userCred.user!.uid).set({
        'uid': userCred.user!.uid,
        'email': email,
      });

      return userCred;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  // Sign up

  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Save User Info into a document

      _firestore.collection('Users').doc(userCred.user!.uid).set({
        'uid': userCred.user!.uid,
        'email': email,
      });

      return userCred;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
  // Errors
}
