import 'package:flutter_modular/flutter_modular.dart';
import 'package:widget_tests/cliente/domain/repositories/i_cliente_repository.dart';
import 'package:widget_tests/cliente/infra/repositories/cliente_repository_mock.dart';
import 'package:widget_tests/main/application/utils_facade.dart';
import 'package:widget_tests/main/application/impl/utils_service.dart';
import 'package:widget_tests/main/domain/repositories/i_external_configs_repository.dart';
import 'package:widget_tests/main/infra/repositories/external_configs_repository_dotenv.dart';
import 'package:widget_tests/pedido/domain/repositories/i_pedido_repository.dart';
import 'package:widget_tests/pedido/infra/repositories/pedido_repository_mock.dart';
import 'package:widget_tests/produto/domain/repositories/i_produto_repository.dart';
import 'package:widget_tests/produto/infra/repositories/produto_repository_mock.dart';

class AppModuleForTests extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<UtilsFacade>((i) => UtilsService()),
        Bind.lazySingleton<IExternalConfigsRepository>((i) => ExternalConfigsRepositoryDotenv(pathDotEnv: 'test/.env')),
        Bind.lazySingleton<IClienteRepository>((i) => ClienteRepositoryMock()),
        Bind.lazySingleton<IProdutoRepository>((i) => ProdutoRepositoryMock()),
        Bind.lazySingleton<IPedidoRepository>((i) => PedidoRepositoryMock()),
      ];
}
