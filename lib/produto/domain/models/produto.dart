import 'dart:convert';

class Produto {
  final int idProduto;
  final String descricao;
  final num preco;
  final num precoComDesconto;
  Produto({
    required this.idProduto,
    required this.descricao,
    required this.preco,
    required this.precoComDesconto,
  });

  Produto copyWith({
    int? idProduto,
    String? descricao,
    num? preco,
    num? precoComDesconto,
  }) {
    return Produto(
      idProduto: idProduto ?? this.idProduto,
      descricao: descricao ?? this.descricao,
      preco: preco ?? this.preco,
      precoComDesconto: precoComDesconto ?? this.precoComDesconto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idProduto': idProduto,
      'descricao': descricao,
      'preco': preco,
      'precoComDesconto': precoComDesconto,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      idProduto: map['idProduto']?.toInt() ?? 0,
      descricao: map['descricao'] ?? '',
      preco: map['preco'] ?? 0,
      precoComDesconto: map['precoComDesconto'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) => Produto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produto(idProduto: $idProduto, descricao: $descricao, preco: $preco, precoComDesconto: $precoComDesconto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Produto &&
        other.idProduto == idProduto &&
        other.descricao == descricao &&
        other.preco == preco &&
        other.precoComDesconto == precoComDesconto;
  }

  @override
  int get hashCode {
    return idProduto.hashCode ^ descricao.hashCode ^ preco.hashCode ^ precoComDesconto.hashCode;
  }
}
