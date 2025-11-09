import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String? userEmail;
  bool loading = false;

  // Simulação de login
  Future<bool> login(String email, String senha) async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); 

    loading = false;
    notifyListeners();

    if (email == 'teste@teste.com' && senha == '123456') {
      userEmail = email;
      return true;
    }
    return false;
  }

  // Simulação de cadastro
  Future<void> register(String email, String senha) async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); 

    loading = false;
    notifyListeners();
  }

  void logout() {
    userEmail = null;
    notifyListeners();  }
}
