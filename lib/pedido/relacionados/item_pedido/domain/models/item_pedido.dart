import 'dart:convert';

import 'package:widget_tests/produto/domain/models/produto.dart';

class ItemPedido {
  final int idPedido;
  final int sequencia;
  final Produto produto;
  final int quantidade;
  ItemPedido({
    required this.idPedido,
    required this.sequencia,
    required this.produto,
    required this.quantidade,
  });

  ItemPedido copyWith({
    int? idPedido,
    int? sequencia,
    Produto? produto,
    int? quantidade,
  }) {
    return ItemPedido(
      idPedido: idPedido ?? this.idPedido,
      sequencia: sequencia ?? this.sequencia,
      produto: produto ?? this.produto,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPedido': idPedido,
      'sequencia': sequencia,
      'produto': produto.toMap(),
      'quantidade': quantidade,
    };
  }

  factory ItemPedido.fromMap(Map<String, dynamic> map) {
    return ItemPedido(
      idPedido: map['idPedido']?.toInt() ?? 0,
      sequencia: map['sequencia']?.toInt() ?? 0,
      produto: Produto.fromMap(map['produto']),
      quantidade: map['quantidade']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemPedido.fromJson(String source) => ItemPedido.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemPedido(idPedido: $idPedido, sequencia: $sequencia, produto: $produto, quantidade: $quantidade)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemPedido &&
        other.idPedido == idPedido &&
        other.sequencia == sequencia &&
        other.produto == produto &&
        other.quantidade == quantidade;
  }

  @override
  int get hashCode {
    return idPedido.hashCode ^ sequencia.hashCode ^ produto.hashCode ^ quantidade.hashCode;
  }
}
