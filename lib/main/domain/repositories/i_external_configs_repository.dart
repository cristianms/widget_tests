abstract class IExternalConfigsRepository {
  Future<void> initialize();
  void printAllConfigs();
}
