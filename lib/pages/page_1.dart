import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  /// Construtor
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: const Center(
        child: Text('Conteúdo - Page 1'),
      ),
    );
  }
}
