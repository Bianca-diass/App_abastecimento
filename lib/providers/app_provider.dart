import 'package:flutter/foundation.dart';
import 'package:controle_abastecimento/services/auth_service.dart';

class AppProvider extends ChangeNotifier {
  bool _loading = false;
  String? _userEmail;

  bool get loading => _loading;
  String? get userEmail => _userEmail;

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    final ok = await AuthService.login(email, password);
    if (ok) _userEmail = email;
    _setLoading(false);
    notifyListeners();
    return ok;
  }

  Future<void> register(String email, String password) async {
    _setLoading(true);
    await AuthService.register(email, password);
    _userEmail = email;
    _setLoading(false);
    notifyListeners();
  }

  void logout() {
    AuthService.logout();
    _userEmail = null;
    notifyListeners();
  }

  void _setLoading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
