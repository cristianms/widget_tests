import 'package:flutter/material.dart';
import 'package:widget_tests/main/application/utils_facade.dart';

class UtilsService implements UtilsFacade {
  @override
  Future<T?> push<T extends Object?>(BuildContext context, Widget paginaDestino) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => paginaDestino),
    );
  }

  @override
  void pop<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.pop(context);
  }
}
