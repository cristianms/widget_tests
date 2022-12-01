import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String titulo;
  final Function() onClick;

  /// Construtor
  const Botao({
    required this.titulo,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        child: Text(titulo),
      ),
    );
  }
}
