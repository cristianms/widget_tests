import 'package:flutter/material.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';

class ListaItensPedido extends StatelessWidget {
  const ListaItensPedido({
    Key? key,
    required this.pedidoProvider,
  }) : super(key: key);

  final PedidoProvider pedidoProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
