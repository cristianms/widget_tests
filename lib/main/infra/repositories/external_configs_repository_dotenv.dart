import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:widget_tests/main/domain/repositories/i_external_configs_repository.dart';

class ExternalConfigsRepositoryDotenv implements IExternalConfigsRepository {
  final String? pathDotEnv;

  /// Construtor
  ExternalConfigsRepositoryDotenv({this.pathDotEnv});

  @override
  Future<void> initialize() async {
    // await Future.delayed(const Duration(seconds: 1));
    if (pathDotEnv != null && pathDotEnv!.isNotEmpty) {
      return dotenv.testLoad(fileInput: File(pathDotEnv!).readAsStringSync());
    }
    // coverage:ignore-start
    return await dotenv.load();
    // coverage:ignore-end
  }
}
