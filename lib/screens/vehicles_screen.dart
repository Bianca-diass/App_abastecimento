import 'package:flutter/material.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  final List<Map<String, dynamic>> _vehicles = [
    {
      'modelo': 'Onix',
      'marca': 'Chevrolet',
      'placa': 'ABC-1234',
      'ano': 2020,
      'combustivel': 'Gasolina',
    },
    {
      'modelo': 'Civic',
      'marca': 'Honda',
      'placa': 'XYZ-5678',
      'ano': 2022,
      'combustivel': 'Etanol',
    },
  ];

  void _addVehicleDialog() {
    final formKey = GlobalKey<FormState>();
    final modeloController = TextEditingController();
    final marcaController = TextEditingController();
    final placaController = TextEditingController();
    final anoController = TextEditingController();
    final combustivelController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: const Text('Cadastrar Veículo'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: modeloController,
                  decoration: const InputDecoration(labelText: 'Modelo'),
                  validator: (v) => v!.isEmpty ? 'Informe o modelo' : null,
                ),
                TextFormField(
                  controller: marcaController,
                  decoration: const InputDecoration(labelText: 'Marca'),
                  validator: (v) => v!.isEmpty ? 'Informe a marca' : null,
                ),
                TextFormField(
                  controller: placaController,
                  decoration: const InputDecoration(labelText: 'Placa'),
                  validator: (v) => v!.isEmpty ? 'Informe a placa' : null,
                ),
                TextFormField(
                  controller: anoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Ano'),
                  validator: (v) => v!.isEmpty ? 'Informe o ano' : null,
                ),
                TextFormField(
                  controller: combustivelController,
                  decoration:
                      const InputDecoration(labelText: 'Tipo de Combustível'),
                  validator: (v) =>
                      v!.isEmpty ? 'Informe o tipo de combustível' : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                  _vehicles.add({
                    'modelo': modeloController.text,
                    'marca': marcaController.text,
                    'placa': placaController.text.toUpperCase(),
                    'ano': int.tryParse(anoController.text) ?? 0,
                    'combustivel': combustivelController.text,
                  });
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _deleteVehicle(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remover Veículo'),
        content: Text(
          'Tem certeza que deseja excluir o veículo ${_vehicles[index]['modelo']}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _vehicles.removeAt(index);
              });
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
        title: const Text('Meus Veículos'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addVehicleDialog,
        icon: const Icon(Icons.add),
        label: const Text('Novo Veículo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: _vehicles.isEmpty
          ? const Center(
              child: Text(
                'Nenhum veículo cadastrado ainda.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _vehicles.length,
              itemBuilder: (context, i) {
                final v = _vehicles[i];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.deepPurple[100],
                      child: const Icon(Icons.directions_car_rounded,
                          color: Colors.deepPurple),
                    ),
                    title: Text('${v['marca']} ${v['modelo']}'),
                    subtitle: Text(
                      'Placa: ${v['placa']}\nAno: ${v['ano']} - ${v['combustivel']}',
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _deleteVehicle(i),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
