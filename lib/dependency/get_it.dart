import 'get_it_service_exports.dart';

final getItInstance = GetIt.I;

Future initDependencies() async {
  // Service helpers
  // getItInstance.registerSingleton<ServiceHelpersImp>(ServiceHelpersImp(
  //   httpClient: getItInstance(),
  //   tempDatabaseImpl: getItInstance(),
  // ));

  // Navigation service
  getItInstance.registerLazySingleton<NavigationServiceImpl>(
      () => NavigationServiceImpl());

  // Auth cubit
  // getItInstance
  //     .registerFactory(() => AuthCubit(authServiceImp: getItInstance()));
}
