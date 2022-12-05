import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/pedido/relacionados/item_pedido/domain/models/item_pedido.dart';

class Pedido {
  final int idPedido;
  final List<ItemPedido> itens;
  Cliente cliente;
  Pedido({
    required this.idPedido,
    required this.cliente,
    required this.itens,
  });

  Pedido copyWith({
    int? idPedido,
    Cliente? cliente,
    List<ItemPedido>? itens,
  }) {
    return Pedido(
      idPedido: idPedido ?? this.idPedido,
      cliente: cliente ?? this.cliente,
      itens: itens ?? this.itens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPedido': idPedido,
      'cliente': cliente.toMap(),
      'itens': itens.map((x) => x.toMap()).toList(),
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      idPedido: map['idPedido']?.toInt() ?? 0,
      cliente: Cliente.fromMap(map['cliente']),
      itens: List<ItemPedido>.from(map['itens']?.map((x) => ItemPedido.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) => Pedido.fromMap(json.decode(source));

  @override
  String toString() => 'Pedido(idPedido: $idPedido, cliente: $cliente, itens: $itens)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pedido && other.idPedido == idPedido && other.cliente == cliente && listEquals(other.itens, itens);
  }

  @override
  int get hashCode =>
      idPedido.hashCode ^ cliente.hashCode ^ itens.fold(0, (previousValue, element) => previousValue.hashCode + element.hashCode).hashCode;

  void addItemPedido(ItemPedido itemPedido) {
    itens.add(itemPedido);
  }

  num valorTotalPedido() {
    return itens.map((item) => item.quantidade * item.produto.preco).fold(0, (previousValue, element) => previousValue + element);
  }
}
