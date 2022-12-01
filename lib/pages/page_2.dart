import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String conteudo;

  /// Construtor
  const Page2({
    this.conteudo = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Text(conteudo.isNotEmpty ? conteudo : 'Nenhum conteúdo...'),
      ),
    );
  }
}
