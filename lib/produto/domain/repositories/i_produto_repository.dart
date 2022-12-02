import 'package:widget_tests/produto/domain/models/produto.dart';

abstract class IProdutoRepository {
  List<Produto> getAllProdutos();
}
