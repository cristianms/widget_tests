import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/cliente/domain/repositories/i_cliente_repository.dart';
import 'package:widget_tests/main/application/utils_facade.dart';
import 'package:widget_tests/pedido/domain/repositories/i_pedido_repository.dart';
import 'package:widget_tests/pedido/infra/ui/pages/catalogo_produtos_page.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';
import 'package:widget_tests/pedido/infra/ui/widgets/dropdown_selecao_cliente.dart';
import 'package:widget_tests/pedido/infra/ui/widgets/lista_itens_pedido.dart';

class CapaPedidoPage extends StatefulWidget {
  const CapaPedidoPage({super.key});

  @override
  State<CapaPedidoPage> createState() => _CapaPedidoPageState();
}

class _CapaPedidoPageState extends State<CapaPedidoPage> {
  late List<Cliente> listaClientes;
  late PedidoProvider pedidoProvider;

  final pedidoRepository = Modular.get<IPedidoRepository>();
  final utilsFacade = Modular.get<UtilsFacade>();
  final clienteRepository = Modular.get<IClienteRepository>();

  @override
  void initState() {
    listaClientes = clienteRepository.getAllClientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pedidoProvider = Provider.of<PedidoProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: const Text('Pedido')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // Título campo cliente
            const Padding(padding: EdgeInsets.only(top: 8.0), child: Text('Cliente', style: TextStyle(fontSize: 20))),
            // Campo de seleção de cliente
            DropdownSelecaoCliente(listaClientes: listaClientes),
            // Título lista itens do pedido
            const Padding(padding: EdgeInsets.only(top: 8.0), child: Text('Itens do pedido', style: TextStyle(fontSize: 20))),
            // Lista itens do pedido
            ListaItensPedido(pedidoProvider: pedidoProvider),
            // Resumo
            const Padding(padding: EdgeInsets.only(top: 8.0), child: Text('Resumo', style: TextStyle(fontSize: 20))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Qtd de itens: ${pedidoProvider.pedido!.itens.length}'),
                  Text('Valor total do pedido: R\$ ${pedidoProvider.pedido!.valorTotalPedido()}'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('add-item-pedido'),
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () => utilsFacade.push(context, const CatalogoProdutosPage()),
      ),
    );
  }
}
