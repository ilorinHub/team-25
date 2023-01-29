import 'package:get_it/get_it.dart';
import 'package:machineglow/core/api/network/network.dart';
import 'package:machineglow/core/services/storage/storage_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'injection_containers.dart';

final sl = GetIt.instance;

class AppInjectionContainer {
  static Future<void> init() async {
    //general dependencies
    final prefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => prefs);
    sl.registerLazySingleton<StorageService>(
      () => StorageServiceImpl(sharedPreferences: sl()),
    );
    sl.registerLazySingleton<ApiClient>(
      () => ApiClient(storageService: sl()),
    );

    AuthInjectionContainer.init();
    ThemeInjectionContainer.init();
    DashboardInjectionContainer.init();
  }
}
