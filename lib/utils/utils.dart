import 'package:flutter/material.dart';

Future<T?> push<T extends Object?>(BuildContext context, Widget paginaDestino) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => paginaDestino),
  );
}
