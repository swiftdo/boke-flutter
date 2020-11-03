import 'package:boke/services/net/web_repository.dart';
import 'package:get_it/get_it.dart';
import 'config/config.dart';
import 'services/services.dart';

GetIt locator = GetIt.instance;

/// 依赖注入
void setupLocator(ConfigEnv env) {
  locator.registerLazySingleton<Config>(() => env == ConfigEnv.develop ? ConfigDev() : ConfigPro());
  locator.registerLazySingleton(() => ServiceNavigation());
  locator.registerLazySingleton(() => WebRepository());
  locator.registerLazySingleton(() => SpiderRepository());
}
