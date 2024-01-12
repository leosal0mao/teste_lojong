import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_lojong/core/network/server_adapter_impl.dart';
import 'package:teste_lojong/features/app/di/dependency_injection.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Network Handler
  getIt.registerFactory<Dio>(() => Dio());
  // Server API Client
  getIt.registerLazySingleton(
    () => ServerAdapterImpl(dio: getIt()),
  );
}

Future<void> initFeaturesDependecies() async {
  getIt.pushNewScope();
  await initApp();
}
