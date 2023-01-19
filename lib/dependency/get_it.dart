import 'cubit/dashboard_cubit/dashboard_cubit.dart';
import 'cubit/profile_cubit/profile_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'get_it_service_exports.dart';

final getItInstance = GetIt.I;

Future initDependencies() async {
  // Service helpers
  getItInstance.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getItInstance.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  getItInstance
      .registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // Navigation service
  getItInstance.registerLazySingleton<NavigationServiceImpl>(
      () => NavigationServiceImpl());

  getItInstance.registerFactory(() => ProfileCubit());

  getItInstance.registerFactory(() => DashboardCubit());
}
