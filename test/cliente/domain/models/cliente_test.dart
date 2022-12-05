import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';

void main() {
  late Cliente clientePadrao;
  setUp(() {
    clientePadrao = Cliente(
      idCliente: 1,
      razaoSocial: 'ABC Ltda',
      fantasia: 'ABC',
      documento: '75.985.839/0001-25',
    );
  });
  test('Teste construtor', () {
    expect(clientePadrao.idCliente, equals(1));
    expect(clientePadrao.razaoSocial, equals('ABC Ltda'));
    expect(clientePadrao.fantasia, equals('ABC'));
    expect(clientePadrao.documento, equals('75.985.839/0001-25'));
  });
  test('Teste copywith', () {
    Cliente clienteCopy = clientePadrao.copyWith(
      idCliente: 2,
      razaoSocial: 'DEF Ltda',
      fantasia: 'DEF',
      documento: '99.999.999/0001-99',
    );
    expect(clienteCopy.idCliente, equals(2));
    expect(clienteCopy.razaoSocial, equals('DEF Ltda'));
    expect(clienteCopy.fantasia, equals('DEF'));
    expect(clienteCopy.documento, equals('99.999.999/0001-99'));
  });
  test('Teste copywith vazio', () {
    Cliente clienteCopy = clientePadrao.copyWith();
    expect(clienteCopy.idCliente, equals(1));
    expect(clienteCopy.razaoSocial, equals('ABC Ltda'));
    expect(clienteCopy.fantasia, equals('ABC'));
    expect(clienteCopy.documento, equals('75.985.839/0001-25'));

  });
  test('Teste toMap', () {
    Map<String, dynamic> clienteMap = clientePadrao.toMap();
    expect(clienteMap, equals({'idCliente': 1, 'razaoSocial': 'ABC Ltda', 'fantasia': 'ABC', 'documento': '75.985.839/0001-25'}));
  });
  test('Teste toJson', () {
    String clienteJson = clientePadrao.toJson();
    expect(clienteJson, equals('{"idCliente":1,"razaoSocial":"ABC Ltda","fantasia":"ABC","documento":"75.985.839/0001-25"}'));
  });
  test('Teste fromMap', () {
    Map<String, dynamic> clienteMap = clientePadrao.toMap();
    Cliente clienteFromMap = Cliente.fromMap(clienteMap);
    expect(clienteFromMap.idCliente, equals(1));
    expect(clienteFromMap.razaoSocial, equals('ABC Ltda'));
    expect(clienteFromMap.fantasia, equals('ABC'));
    expect(clienteFromMap.documento, equals('75.985.839/0001-25'));
  });
  test('Teste fromJson', () {
    String clienteJson = clientePadrao.toJson();
    Cliente clienteFromMap = Cliente.fromJson(clienteJson);
    expect(clienteFromMap.idCliente, equals(1));
    expect(clienteFromMap.razaoSocial, equals('ABC Ltda'));
    expect(clienteFromMap.fantasia, equals('ABC'));
    expect(clienteFromMap.documento, equals('75.985.839/0001-25'));
  });
  test('Teste toString', () {
    String str = clientePadrao.toString();
    expect(str, equals('Cliente(idCliente: 1, razaoSocial: ABC Ltda, fantasia: ABC, documento: 75.985.839/0001-25)'));
  });
  test('Teste ==', () {
    Cliente clienteCopy = clientePadrao.copyWith();
    expect(clientePadrao.idCliente, equals(clienteCopy.idCliente));
    expect(clientePadrao.razaoSocial, equals(clienteCopy.razaoSocial));
    expect(clientePadrao.fantasia, equals(clienteCopy.fantasia));
    expect(clientePadrao.documento, equals(clienteCopy.documento));
  });
}
