import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _loading = false;
  User? _user;

  bool get loading => _loading;
  User? get user => _user;
  String? get userEmail => _user?.email;

  AppProvider() {
    _user = _auth.currentUser;
    _auth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = credential.user;
      _setLoading(false);
      return true;
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      print('Erro login: $e');
      return false;
    }
  }

  Future<String?> register(String email, String password) async {
    _setLoading(true);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = credential.user;
      _setLoading(false);
      return null; // sem erro
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      print('Erro registro: $e');
      return e.message;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
