import 'package:flutter/material.dart';

class AbastecimentosScreen extends StatefulWidget {
  const AbastecimentosScreen({super.key});

  @override
  State<AbastecimentosScreen> createState() => _AbastecimentosScreenState();
}

class _AbastecimentosScreenState extends State<AbastecimentosScreen> {
  final List<Map<String, dynamic>> _abastecimentos = [
    {
      'data': '05/11/2025',
      'litros': 40.0,
      'valor': 250.00,
      'km': 45200,
      'combustivel': 'Gasolina',
      'veiculo': 'HB20'
    },
    {
      'data': '21/10/2025',
      'litros': 35.0,
      'valor': 210.00,
      'km': 44750,
      'combustivel': 'Etanol',
      'veiculo': 'Civic'
    },
  ];

  void _adicionarAbastecimento() {
    showDialog(
      context: context,
      builder: (context) {
        final formKey = GlobalKey<FormState>();
        final dataController = TextEditingController();
        final litrosController = TextEditingController();
        final valorController = TextEditingController();
        final kmController = TextEditingController();
        final combustivelController = TextEditingController();
        final veiculoController = TextEditingController();

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Novo Abastecimento'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: dataController,
                    decoration: const InputDecoration(labelText: 'Data'),
                    validator: (v) =>
                        v!.isEmpty ? 'Informe a data' : null,
                  ),
                  TextFormField(
                    controller: litrosController,
                    decoration: const InputDecoration(labelText: 'Litros'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        v!.isEmpty ? 'Informe os litros' : null,
                  ),
                  TextFormField(
                    controller: valorController,
                    decoration: const InputDecoration(labelText: 'Valor pago'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        v!.isEmpty ? 'Informe o valor' : null,
                  ),
                  TextFormField(
                    controller: kmController,
                    decoration:
                        const InputDecoration(labelText: 'Quilometragem'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        v!.isEmpty ? 'Informe a quilometragem' : null,
                  ),
                  TextFormField(
                    controller: combustivelController,
                    decoration:
                        const InputDecoration(labelText: 'Tipo de combustível'),
                    validator: (v) =>
                        v!.isEmpty ? 'Informe o tipo de combustível' : null,
                  ),
                  TextFormField(
                    controller: veiculoController,
                    decoration:
                        const InputDecoration(labelText: 'Veículo'),
                    validator: (v) =>
                        v!.isEmpty ? 'Informe o veículo' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    _abastecimentos.insert(0, {
                      'data': dataController.text,
                      'litros': double.tryParse(litrosController.text) ?? 0,
                      'valor': double.tryParse(valorController.text) ?? 0,
                      'km': int.tryParse(kmController.text) ?? 0,
                      'combustivel': combustivelController.text,
                      'veiculo': veiculoController.text,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _removerAbastecimento(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir registro'),
        content: const Text('Deseja realmente excluir este abastecimento?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _abastecimentos.removeAt(index));
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abastecimentos'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _adicionarAbastecimento,
        label: const Text('Novo'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
      body: _abastecimentos.isEmpty
          ? const Center(
              child: Text(
                'Nenhum abastecimento registrado ainda.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _abastecimentos.length,
              itemBuilder: (context, i) {
                final item = _abastecimentos[i];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple[100],
                      child: const Icon(Icons.local_gas_station,
                          color: Colors.deepPurple),
                    ),
                    title: Text(
                      '${item['veiculo']} - ${item['combustivel']}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${item['data']} | ${item['litros']} L | R\$ ${item['valor'].toStringAsFixed(2)}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _removerAbastecimento(i),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
