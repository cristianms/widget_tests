import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/main/infra/ui/widgets/wrap_material.dart';

import '../main_test_injection.dart';

/// Envolve o [widget] em um [WrapMaterialWidget]/[MaterialApp] e executa o pumpWidget através do [tester]
Future<void> pumpMaterialWidget({required WidgetTester tester, Widget? widget, Key? key}) async {
  await tester.pumpWidget(
    ModularApp(
      module: AppModuleForTests(),
      child: WrapMaterial(
        widgetParaTestes: widget,
        key: key,
      ),
    ),
  );
}
