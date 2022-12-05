import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests/main/application/utils_facade.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';
import 'package:widget_tests/pedido/infra/ui/widgets/produto_tile.dart';
import 'package:widget_tests/pedido/relacionados/item_pedido/domain/models/item_pedido.dart';
import 'package:widget_tests/produto/domain/repositories/i_produto_repository.dart';

class CatalogoProdutosPage extends StatefulWidget {
  const CatalogoProdutosPage({super.key});

  @override
  State<CatalogoProdutosPage> createState() => _CatalogoProdutosPageState();
}

class _CatalogoProdutosPageState extends State<CatalogoProdutosPage> {
  List<ItemPedido> listaItensCarrinho = [];

  @override
  Widget build(BuildContext context) {
    final listaProdutosCatalogo = Modular.get<IProdutoRepository>().getAllProdutos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de produtos'),
        actions: [
          IconButton(
            key: const Key('salvar-itens-selecionados'),
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () => salvarItensCarrinhoNoPedido(),
          ),
        ],
      ),
      body: ListView(
        children: listaProdutosCatalogo
            .map((produto) => ProdutoTile(
                  key: Key('tile-prod-id-${produto.idProduto.toString()}'),
                  produto: produto,
                  listaItensCarrinho: listaItensCarrinho,
                ))
            .toList(),
      ),
    );
  }

  void salvarItensCarrinhoNoPedido() {
    PedidoProvider pedidoProvider = Provider.of<PedidoProvider>(context, listen: false);
    for (var itemPedidoCarrinho in listaItensCarrinho) {
      pedidoProvider.addItemPedido(itemPedidoCarrinho);
    }
    listaItensCarrinho.clear();
    Modular.get<UtilsFacade>().pop(context);
  }
}
