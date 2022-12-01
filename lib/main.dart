import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:widget_tests/main/infra/ui/widgets/wrap_material.dart';
import 'package:widget_tests/main_injection.dart';

// coverage:ignore-start
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Mantém a splash nativa até que seja solicitado o 'FlutterNativeSplash.remove()'
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Carrega dados de inicialização
  // Carrega sharedPrefs
  await Future.delayed(const Duration(milliseconds: 500));
  // Carrega outras coisas...
  await Future.delayed(const Duration(milliseconds: 500));

  // Inicializa o Flutter
  //
  // Envolve o app em um ModularApp para ter acesso a injeção de dependências
  runApp(
    ModularApp(
      module: AppModule(), // Carregamento das injeções
      child: const WrapMaterial(), // Widget da aplicação
    ),
  );
}
// coverage:ignore-end
