import 'package:flutter/material.dart';
import 'package:controle_abastecimento/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Início')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: theme.colorScheme.primaryContainer,
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.network(
                      'https://img.icons8.com/ios-filled/200/000000/car--v1.png',
                      height: 120,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Bem-vindo ao Controle de Abastecimento',
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Use o menu (hamburger) para acessar veículos e registrar abastecimentos.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
