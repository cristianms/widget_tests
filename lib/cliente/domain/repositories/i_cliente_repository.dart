import 'package:widget_tests/cliente/domain/models/cliente.dart';

abstract class IClienteRepository {
  List<Cliente> getAllClientes();
}
