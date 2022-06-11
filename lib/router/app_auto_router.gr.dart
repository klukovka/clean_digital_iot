// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../pages/setup_event_page.dart' as _i2;
import '../pages/setup_iot_page.dart' as _i1;

class AppAutoRouter extends _i3.RootStackRouter {
  AppAutoRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SetupIotRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SetupIotPage(),
          transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    SetupEventRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.SetupEventPage(),
          transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/setup/iot', fullMatch: true),
        _i3.RouteConfig(SetupIotRoute.name, path: '/setup/iot'),
        _i3.RouteConfig(SetupEventRoute.name, path: '/setup/event')
      ];
}

/// generated route for
/// [_i1.SetupIotPage]
class SetupIotRoute extends _i3.PageRouteInfo<void> {
  const SetupIotRoute() : super(SetupIotRoute.name, path: '/setup/iot');

  static const String name = 'SetupIotRoute';
}

/// generated route for
/// [_i2.SetupEventPage]
class SetupEventRoute extends _i3.PageRouteInfo<void> {
  const SetupEventRoute() : super(SetupEventRoute.name, path: '/setup/event');

  static const String name = 'SetupEventRoute';
}
