import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests/main/infra/ui/pages/home_page.dart';
import 'package:widget_tests/pedido/infra/ui/providers/pedido_provider.dart';

/// Widget para envolver o aplicativo ou o [widgetParaTestes] em um [MaterialApp]
/// Obs.: Caso esse widget esteja sendo carregado para fins de testes, utiliza o [widgetParaTestes] ao invés da aplicação
class WrapMaterial extends StatelessWidget {
  /// Utilizado nos testes de widget
  final Widget? widgetParaTestes;

  /// Construtor
  const WrapMaterial({
    this.widgetParaTestes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Remove a splash nativa
    FlutterNativeSplash.remove();
    // Inicializa MaterialApp
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PedidoProvider()),
      ],
      child: MaterialApp(
        title: '',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: widgetParaTestes ?? const HomePage(),
      ),
    );
  }
}
