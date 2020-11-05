import 'package:get_it/get_it.dart';
import 'package:weather_app/services/authentication_service.dart';
import 'package:weather_app/services/dialog_service.dart';
import 'package:weather_app/services/firestore_service.dart';
import 'package:weather_app/services/navigationService.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());

// getIt.registerLazySingleton<Authentication>(() =>Authentication());
// getIt.registerLazySingleton<Authentication>(() =>Authentication());
}
