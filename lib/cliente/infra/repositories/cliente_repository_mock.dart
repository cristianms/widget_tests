import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/cliente/domain/repositories/i_cliente_repository.dart';

class ClienteRepositoryMock implements IClienteRepository {
  List<Cliente> listaClientes = [
    Cliente(idCliente: 1, razaoSocial: 'Cliente A Ltda', fantasia: 'Cliente A Ltda', documento: '91.162.425/0001-52'),
    Cliente(idCliente: 2, razaoSocial: 'Cliente B Ltda', fantasia: 'Cliente B Ltda', documento: '47.194.544/0001-03'),
    Cliente(idCliente: 3, razaoSocial: 'Cliente C Ltda', fantasia: 'Cliente C Ltda', documento: '81.735.382/0001-01'),
  ];

  @override
  List<Cliente> getAllClientes() {
    return listaClientes;
  }
}
