import 'package:flutter/material.dart';
import 'package:widget_tests/pedido/relacionados/item_pedido/domain/models/item_pedido.dart';

import '../../../domain/models/pedido.dart';

class PedidoProvider with ChangeNotifier {
  Pedido? _novoPedido;

  Pedido? get pedido => _novoPedido;

  void setPedido(Pedido pedido) {
    _novoPedido = pedido;
    notifyListeners();
  }

  void addItemPedido(ItemPedido itemPedido) {
    if (_novoPedido != null) {
      _novoPedido!.addItemPedido(itemPedido);
      notifyListeners();
    } else {
      throw Exception('Nenhum pedido definido no provider');
    }
  }
}
