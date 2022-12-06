import 'package:widget_tests/pedido/domain/models/pedido.dart';
import 'package:widget_tests/pedido/domain/repositories/i_pedido_repository.dart';

class PedidoRepositoryMock implements IPedidoRepository {
  List<Pedido> listaPedidos = [];

  @override
  List<Pedido> getAllPedidos() {
    return listaPedidos;
  }
}
