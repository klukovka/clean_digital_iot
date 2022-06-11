import 'preferences_service.dart';
import 'package:injectable/injectable.dart';

import '../router/clean_digital_router.dart';

@injectable
class LogoutService {
  final PreferencesService _preferencesService;
  final CleanDigitalRouter _router;

  LogoutService(
    this._preferencesService,
    this._router,
  );

  Future<void> logout() async {
    await _preferencesService.logout();
    _router.replaceSetupIotPage();
  }
}
