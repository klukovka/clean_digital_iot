import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../router/app_auto_router.gr.dart';
import 'injection_container.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
  ignoreUnregisteredTypes: [AppAutoRouter],
)
Future<void> configureDependencies() async {
  locator.registerSingleton<AppAutoRouter>(AppAutoRouter());
  await $configureDependencies(locator);
}
