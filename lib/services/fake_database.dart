import 'package:flutter/material.dart';

/// Simulação de um banco de dados local em memória.
/// Funciona até o app ser fechado (não salva em disco).
class FakeDatabase with ChangeNotifier {
  final List<Map<String, dynamic>> _veiculos = [];
  final List<Map<String, dynamic>> _abastecimentos = [];

  // ======== VEÍCULOS ========

  List<Map<String, dynamic>> get veiculos => List.unmodifiable(_veiculos);

  void adicionarVeiculo({
    required String modelo,
    required String marca,
    required String placa,
    required int ano,
    required String tipoCombustivel,
  }) {
    _veiculos.add({
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'modelo': modelo,
      'marca': marca,
      'placa': placa.toUpperCase(),
      'ano': ano,
      'tipoCombustivel': tipoCombustivel,
    });
    notifyListeners();
  }

  void removerVeiculo(String id) {
    _veiculos.removeWhere((v) => v['id'] == id);
    notifyListeners();
  }

  // ======== ABASTECIMENTOS ========

  List<Map<String, dynamic>> get abastecimentos =>
      List.unmodifiable(_abastecimentos);

  void registrarAbastecimento({
    required String veiculoId,
    required DateTime data,
    required double quantidadeLitros,
    required double valorPago,
    required double quilometragem,
    required String tipoCombustivel,
    String? observacao,
  }) {
    // Calcula o consumo médio se possível
    double consumo = 0;
    if (quantidadeLitros > 0 && quilometragem > 0) {
      consumo = quilometragem / quantidadeLitros;
    }

    _abastecimentos.add({
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'veiculoId': veiculoId,
      'data': data,
      'quantidadeLitros': quantidadeLitros,
      'valorPago': valorPago,
      'quilometragem': quilometragem,
      'tipoCombustivel': tipoCombustivel,
      'consumo': consumo.toStringAsFixed(2),
      'observacao': observacao ?? '',
    });
    notifyListeners();
  }

  List<Map<String, dynamic>> abastecimentosDoVeiculo(String veiculoId) {
    return _abastecimentos
        .where((a) => a['veiculoId'] == veiculoId)
        .toList();
  }

  void removerAbastecimento(String id) {
    _abastecimentos.removeWhere((a) => a['id'] == id);
    notifyListeners();
  }

  // ======== UTILIDADES ========

  void limparTudo() {
    _veiculos.clear();
    _abastecimentos.clear();
    notifyListeners();
  }
}
