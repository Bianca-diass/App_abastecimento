class AuthService {
  // Simples simulação: aceita o par de credenciais abaixo somente para login.
  // Register apenas grava em memória (simulado).
  static const demoEmail = 'teste@email.com';
  static const demoPassword = '123456';

  static final List<Map<String, String>> _users = [];

  static Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600));
    // allow demo user or any registered user
    if ((email == demoEmail && password == demoPassword) ||
        _users.any((u) => u['email'] == email && u['password'] == password)) {
      return true;
    }
    return false;
  }

  static Future<void> register(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600));
    _users.add({'email': email, 'password': password});
  }

  static void logout() {
    // nothing to clear in fake service
  }
}
