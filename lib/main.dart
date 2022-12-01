import 'package:flutter/material.dart';
import 'package:widget_tests/pages/page_1.dart';
import 'package:widget_tests/pages/page_2.dart';
import 'package:widget_tests/utils/utils.dart';
import 'package:widget_tests/widgets/botao.dart';

// coverage:ignore-start
void main() => runApp(const WrapMaterialApp());
// coverage:ignore-end

/// Widget para envolver o aplicativo ou o [widgetParaTestes] em um [MaterialApp]
class WrapMaterialApp extends StatelessWidget {
  final Widget? widgetParaTestes;
  const WrapMaterialApp({
    this.widgetParaTestes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: widgetParaTestes ?? const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  /// Construtor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Botao(
                key: const Key('home-botao-1'),
                titulo: 'Teste 1',
                onClick: () async => push(context, const Page1()),
              ),
              Botao(
                key: const Key('home-botao-2'),
                titulo: 'Teste 2',
                onClick: () => push(context, const Page2(conteudo: 'Lorem ipsum 2')),
              ),
              Botao(
                key: const Key('home-botao-3'),
                titulo: 'Teste 3',
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
