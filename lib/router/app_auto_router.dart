import 'package:auto_route/auto_route.dart';
import 'package:clean_digital_iot/pages/scan_qr_page.dart';
import 'package:clean_digital_iot/pages/setup_event_page.dart';

import '../pages/setup_iot_page.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Tab,Route',
  routes: [
    CustomRoute(
      page: SetupIotPage,
      path: '/setup/iot',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: SetupEventPage,
      path: '/setup/event',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
    CustomRoute(
      page: ScanQrPage,
      path: '/setup/event/:eventId',
      initial: true,
      transitionsBuilder: _fadeIn,
      durationInMilliseconds: _durationInMilliseconds,
    ),
  ],
)
class $AppAutoRouter {}
