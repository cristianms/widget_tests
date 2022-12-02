import 'package:widget_tests/pedido/domain/models/pedido.dart';

abstract class IPedidoRepository {
  List<Pedido> getAllPedidos();
}
