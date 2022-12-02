import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';
import 'package:widget_tests/pedido/relacionados/item_pedido/domain/models/item_pedido.dart';
import 'package:widget_tests/produto/domain/models/produto.dart';

class ProdutoTile extends StatefulWidget {
  final Produto produto;
  final List<ItemPedido> listaItensCarrinho;

  /// Construtor
  const ProdutoTile({super.key, required this.produto, required this.listaItensCarrinho});

  @override
  State<ProdutoTile> createState() => _ProdutoTileState();
}

class _ProdutoTileState extends State<ProdutoTile> {
  late PedidoProvider pedidoProvider;

  @override
  void initState() {
    pedidoProvider = Provider.of<PedidoProvider>(context, listen: false);
    super.initState();
  }

  int qtd = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(widget.produto.descricao),
              subtitle: Text('R\$ ${widget.produto.preco.toString()}'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text('Qtd'),
                Text(
                  '$qtd',
                  key: Key('tile-prod-id-${widget.produto.idProduto.toString()}-qtd'),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      if (qtd > 0) {
                        setState(() {
                          qtd--;
                          dccItemPedido(widget.produto, qtd);
                          if (kDebugMode) {
                            print(widget.listaItensCarrinho.length);
                          }
                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    key: Key('tile-prod-${widget.produto.idProduto}-add'),
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        qtd++;
                        addItemPedido(widget.produto, qtd);
                        if (kDebugMode) {
                          print(widget.listaItensCarrinho.length);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addItemPedido(Produto produto, int qtd) {
    List<ItemPedido> listaFiltrada = widget.listaItensCarrinho.where((itemListaCarrinho) {
      return itemListaCarrinho.produto.idProduto == produto.idProduto;
    }).toList();
    // Se não encontrou o produto adiciona um novo
    if (listaFiltrada.isEmpty) {
      widget.listaItensCarrinho.add(ItemPedido(
        // idPedido: pedidoProvider.pedido!.idPedido,
        // sequencia: pedidoProvider.pedido!.itens.length + 1,
        produto: widget.produto,
        quantidade: qtd,
      ));
    } else {
      listaFiltrada.first.quantidade = qtd;
    }
  }

  void dccItemPedido(Produto produto, int qtd) {
    List<ItemPedido> listaFiltrada =
        widget.listaItensCarrinho.where((e) => e.idPedido == pedidoProvider.pedido!.idPedido && e.produto.idProduto == produto.idProduto).toList();
    listaFiltrada.first.quantidade = qtd;
    if (qtd == 0) {
      listaFiltrada.remove(listaFiltrada.first);
    }
  }
}
