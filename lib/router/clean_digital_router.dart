import 'package:injectable/injectable.dart';

import '../di/injection_container.dart';
import 'app_auto_router.gr.dart';
import 'base_router.dart';

final router = locator<CleanDigitalRouter>();

@singleton
class CleanDigitalRouter extends BaseRouter {
  CleanDigitalRouter(AppAutoRouter router) : super(router);

  Future<void> replaceSetupIotPage() async {
    await pushAndClearStack(const SetupIotRoute());
  }

  Future<void> replaceSetupEventPage() async {
    await replace(const SetupEventRoute());
  }
}
