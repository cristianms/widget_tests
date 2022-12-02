import 'package:widget_tests/produto/domain/models/produto.dart';
import 'package:widget_tests/produto/domain/repositories/i_produto_repository.dart';

class ProdutoRepositoryMock implements IProdutoRepository {
  List<Produto> listaProdutos = [
    Produto(idProduto: 1, descricao: 'Produto 1', preco: 1.00, precoComDesconto: 0.99),
    Produto(idProduto: 2, descricao: 'Produto 2', preco: 2.00, precoComDesconto: 1.99),
    Produto(idProduto: 3, descricao: 'Produto 3', preco: 3.00, precoComDesconto: 2.99),
    Produto(idProduto: 4, descricao: 'Produto 4', preco: 4.00, precoComDesconto: 3.99),
    Produto(idProduto: 1, descricao: 'Produto 5', preco: 5.00, precoComDesconto: 4.99),
    Produto(idProduto: 2, descricao: 'Produto 6', preco: 6.00, precoComDesconto: 5.99),
    Produto(idProduto: 3, descricao: 'Produto 7', preco: 7.00, precoComDesconto: 6.99),
    Produto(idProduto: 4, descricao: 'Produto 8', preco: 8.00, precoComDesconto: 7.99),
    Produto(idProduto: 1, descricao: 'Produto 9', preco: 9.00, precoComDesconto: 8.99),
    Produto(idProduto: 2, descricao: 'Produto 10', preco: 10.00, precoComDesconto: 9.99),
  ];

  @override
  List<Produto> getAllProdutos() {
    return listaProdutos;
  }
}
