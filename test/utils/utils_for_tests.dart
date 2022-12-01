import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_tests/main.dart';

/// Envolve o [widget] em um [WrapMaterialWidget]/[MaterialApp] e executa o pumpWidget através do [tester]
Future<void> pumpMaterialWidget({required WidgetTester tester, required Widget widget, Key? key}) async {
  await tester.pumpWidget(
    WrapMaterialApp(
      widgetParaTestes: widget,
      key: key,
    ),
  );
}
