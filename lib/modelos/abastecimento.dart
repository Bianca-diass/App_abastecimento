class Abastecimento {
  final String id;
  final String veiculoId;
  final DateTime data;
  final double quantidadeLitros;
  final double valorPago;
  final int quilometragem;
  final String tipoCombustivel;
  final String? observacao;


  Abastecimento({
    required this.id,
    required this.veiculoId,
    required this.data,
    required this.quantidadeLitros,
    required this.valorPago,
    required this.quilometragem,
    required this.tipoCombustivel,
    this.observacao,
  });


  double consumo() {
    if (quantidadeLitros <= 0) return 0;
    return quilometragem / quantidadeLitros;
  }
}


