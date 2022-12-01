import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:widget_tests/main/application/utils_facade.dart';
import 'package:widget_tests/main/domain/repositories/i_external_configs_repository.dart';
import 'package:widget_tests/main/infra/ui/pages/page_1.dart';
import 'package:widget_tests/main/infra/ui/pages/page_2.dart';
import 'package:widget_tests/main/infra/ui/widgets/botao.dart';
import 'package:widget_tests/pedido/infra/ui/pages/capa_pedido.dart';

/// Tela inicial do app
class HomePage extends StatefulWidget {
  /// Construtor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Inicializa injeções utilizadas
  final utilsFacade = Modular.get<UtilsFacade>();
  final externalConfigsRepository = Modular.get<IExternalConfigsRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            key: const Key('home-options'),
            icon: const Icon(Icons.info),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder(
        future: externalConfigsRepository.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Botao(
                    key: const Key('home-botao-1'),
                    titulo: 'Teste 1',
                    onClick: () async => await utilsFacade.push(context, const Page1()),
                  ),
                  Botao(
                    key: const Key('home-botao-2'),
                    titulo: 'Teste 2',
                    onClick: () async => await utilsFacade.push(context, const Page2(conteudo: 'Lorem ipsum 2')),
                  ),
                  Botao(
                    key: const Key('home-botao-3'),
                    titulo: 'Teste 3',
                    onClick: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => utilsFacade.push(context, const CapaPedido()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
