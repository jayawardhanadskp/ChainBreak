import 'package:chain_break/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();
  User? _user;

  User? get user => _user;

  // Check if user is signed in
  bool get isAuthenticated => _user != null;

  // Sign up method
  Future<void> signUp(String email, String password, String firstName, String lastName) async {
    final user = await _authService.signUp(email, password, firstName, lastName);
    if (user != null) {
      _user = user;
      notifyListeners();
    } else {
      // Handle sign-up failure
    }
  }

  // Sign in method
  Future<void> signIn(String email, String password) async {
    final user = await _authService.signInWithEmailPassword(email, password);
    if (user != null) {
      _user = user;
      notifyListeners();
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  // Get current user
  void getCurrentUser() {
    _user = _authService.getCurrentUser();
    notifyListeners();
  }
}
