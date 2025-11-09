import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  CollectionReference get vehiclesRef {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection('users').doc(uid).collection('vehicles');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Veículos')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddVehicleDialog(context),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: vehiclesRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Nenhum veículo cadastrado.'));
          }
          final vehicles = snapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: vehicles.length,
            itemBuilder: (_, index) {
              final v = vehicles[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: ListTile(
                  title: Text('${v['marca']} ${v['modelo']}'),
                  subtitle: Text('Placa: ${v['placa']}\nAno: ${v['ano']} - ${v['tipoCombustivel']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => vehiclesRef.doc(v.id).delete(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddVehicleDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final modeloController = TextEditingController();
    final marcaController = TextEditingController();
    final placaController = TextEditingController();
    final anoController = TextEditingController();
    final combustivelController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Cadastrar Veículo'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(modeloController, 'Modelo'),
                _buildTextField(marcaController, 'Marca'),
                _buildTextField(placaController, 'Placa'),
                _buildTextField(anoController, 'Ano', isNumber: true),
                _buildTextField(combustivelController, 'Tipo de combustível'),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancelar')),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final uid = FirebaseAuth.instance.currentUser!.uid;
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .collection('vehicles')
                    .add({
                  'modelo': modeloController.text,
                  'marca': marcaController.text,
                  'placa': placaController.text.toUpperCase(),
                  'ano': int.tryParse(anoController.text) ?? 0,
                  'tipoCombustivel': combustivelController.text,
                });
                Navigator.pop(ctx);
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(labelText: label),
        validator: (v) => v == null || v.isEmpty ? 'Informe $label' : null,
      ),
    );
  }
}
