import 'package:flutter_modular/flutter_modular.dart';
import 'package:widget_tests/main/application/utils_facade.dart';
import 'package:widget_tests/main/application/impl/utils.dart';
import 'package:widget_tests/main/domain/repositories/i_external_configs_repository.dart';
import 'package:widget_tests/main/infra/repositories/external_configs_repository_dotenv.dart';

class AppModuleForTests extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<UtilsFacade>((i) => UtilsService()),
        Bind.lazySingleton<IExternalConfigsRepository>((i) => ExternalConfigsRepositoryDotenv(pathDotEnv: 'test/.env')),
      ];
}
