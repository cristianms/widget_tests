import 'dart:convert';

class Cliente {
  final int idCliente;
  final String razaoSocial;
  final String fantasia;
  final String documento;
  Cliente({
    required this.idCliente,
    required this.razaoSocial,
    required this.fantasia,
    required this.documento,
  });

  Cliente copyWith({
    int? idCliente,
    String? razaoSocial,
    String? fantasia,
    String? documento,
  }) {
    return Cliente(
      idCliente: idCliente ?? this.idCliente,
      razaoSocial: razaoSocial ?? this.razaoSocial,
      fantasia: fantasia ?? this.fantasia,
      documento: documento ?? this.documento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCliente': idCliente,
      'razaoSocial': razaoSocial,
      'fantasia': fantasia,
      'documento': documento,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      idCliente: map['idCliente']?.toInt() ?? 0,
      razaoSocial: map['razaoSocial'] ?? '',
      fantasia: map['fantasia'] ?? '',
      documento: map['documento'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) => Cliente.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cliente(idCliente: $idCliente, razaoSocial: $razaoSocial, fantasia: $fantasia, documento: $documento)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cliente && other.idCliente == idCliente && other.razaoSocial == razaoSocial && other.fantasia == fantasia && other.documento == documento;
  }

  @override
  int get hashCode {
    return idCliente.hashCode ^ razaoSocial.hashCode ^ fantasia.hashCode ^ documento.hashCode;
  }
}
