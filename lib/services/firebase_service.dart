import 'package:chain_break/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // create new user with email and password
  Future<User?> signUp(
      String email, String password, String firstName, String lastName) async {
    try {
      final UserCredential userCredintial =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save additional user data to Firestore
      final user = userCredintial.user;
      if (user != null) {
        // Create UserModel instance with Firebase user details
        UserModel userModel = UserModel(
          uid: user.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
        );

        // Save user data to Firestore
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());

        return user;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      print("Error signing up: $e");
      return null;
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // sign out user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
