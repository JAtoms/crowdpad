import 'cubit/dashboard_cubit/dashboard_cubit.dart';
import 'cubit/profile_cubit/profile_cubit.dart';
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

  getItInstance.registerFactory(() => ProfileCubit());

  getItInstance.registerFactory(() => DashboardCubit());
}
