import 'package:machineglow/core/containers/app_injection_container.dart';
import 'package:machineglow/core/viewmodels/dashboard/upload_viewmodel.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';

class AuthInjectionContainer {
  static Future<void> init() async {
    sl.registerLazySingleton<AuthViewModel>(() => AuthViewModel());
    sl.registerLazySingleton<StateProvider>(
        () => StateProvider(storageService: sl()));
  }
}

class ThemeInjectionContainer {
  static Future<void> init() async {
    sl.registerFactory<GlowThemeViewModel>(() => GlowThemeViewModel());
  }
}

class DashboardInjectionContainer {
  static Future<void> init() async {
    sl.registerFactory<DashboardViewmodel>(() => DashboardViewmodel());
    sl.registerFactory<UploadScreenViewmodel>(() => UploadScreenViewmodel());
  }
}
