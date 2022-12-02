import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests/cliente/domain/models/cliente.dart';
import 'package:widget_tests/cliente/domain/repositories/i_cliente_repository.dart';
import 'package:widget_tests/main/application/utils_facade.dart';
import 'package:widget_tests/pedido/domain/repositories/i_pedido_repository.dart';
import 'package:widget_tests/pedido/infra/ui/pages/catalogo_produtos.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';

class CapaPedido extends StatefulWidget {
  const CapaPedido({super.key});

  @override
  State<CapaPedido> createState() => _CapaPedidoState();
}

class _CapaPedidoState extends State<CapaPedido> {
  late List<Cliente> listaClientes = [];
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
            Expanded(
              child: ListView(
                children: pedidoProvider.pedido!.itens.isEmpty
                    ? [const Center(child: Text('Nenhum item adicionado ao pedido'))]
                    : pedidoProvider.pedido!.itens
                        .map((e) => ListTile(
                              title: Text('${e.produto.descricao} | Qtd: ${e.quantidade.toString()}'),
                              subtitle: Text('Total item: ${e.quantidade * e.produto.preco}'),
                            ))
                        .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart),
        onPressed: () => utilsFacade.push(context, const CatalogoProdutos()),
      ),
    );
  }
}

class DropdownSelecaoCliente extends StatefulWidget {
  final List<Cliente> listaClientes;
  const DropdownSelecaoCliente({required this.listaClientes, super.key});

  @override
  State<DropdownSelecaoCliente> createState() => _DropdownSelecaoClienteState();
}

class _DropdownSelecaoClienteState extends State<DropdownSelecaoCliente> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.listaClientes.first.fantasia;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            style: Theme.of(context).textTheme.titleMedium,
            value: dropdownValue,
            onChanged: (String? value) {
              setState(() => dropdownValue = value!);
            },
            items: widget.listaClientes.map<DropdownMenuItem<String>>((Cliente cliente) {
              return DropdownMenuItem<String>(
                value: cliente.fantasia,
                child: Text(cliente.fantasia),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
