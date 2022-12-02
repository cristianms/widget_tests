import 'package:flutter/material.dart';

abstract class UtilsFacade {
  Future<T?> push<T extends Object?>(BuildContext context, Widget paginaDestino);
  void pop<T extends Object?>(BuildContext context, [T? result]);
}
