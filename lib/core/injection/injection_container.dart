import 'package:get_it/get_it.dart';
import 'package:teste_lojong/features/app/di/dependency_injection.dart';

import '../network/network_info.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Network Handler
  getIt.registerLazySingleton<NetworkInfoRepository>(
    () => NetworkInfoRepositoryImpl(),
  );
  // Server API Client
  // getIt.registerLazySingleton(
  //   () => ServerApiClient(
  //     networkInfoRepository: getIt(),
  //   ),
  // );
}

Future<void> initFeaturesDependecies() async {
  getIt.pushNewScope();
  await initApp();
}
