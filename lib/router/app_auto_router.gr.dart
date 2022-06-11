// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/scan_qr_page.dart' as _i3;
import '../pages/setup_event_page.dart' as _i2;
import '../pages/setup_iot_page.dart' as _i1;

class AppAutoRouter extends _i4.RootStackRouter {
  AppAutoRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SetupIotRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SetupIotPage(),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    SetupEventRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.SetupEventPage(),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ScanQrRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ScanQrRouteArgs>(
          orElse: () =>
              ScanQrRouteArgs(eventId: pathParams.getString('eventId')));
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.ScanQrPage(key: args.key, eventId: args.eventId),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/setup/iot', fullMatch: true),
        _i4.RouteConfig(SetupIotRoute.name, path: '/setup/iot'),
        _i4.RouteConfig(SetupEventRoute.name, path: '/setup/event'),
        _i4.RouteConfig(ScanQrRoute.name, path: '/setup/event/:eventId')
      ];
}

/// generated route for
/// [_i1.SetupIotPage]
class SetupIotRoute extends _i4.PageRouteInfo<void> {
  const SetupIotRoute() : super(SetupIotRoute.name, path: '/setup/iot');

  static const String name = 'SetupIotRoute';
}

/// generated route for
/// [_i2.SetupEventPage]
class SetupEventRoute extends _i4.PageRouteInfo<void> {
  const SetupEventRoute() : super(SetupEventRoute.name, path: '/setup/event');

  static const String name = 'SetupEventRoute';
}

/// generated route for
/// [_i3.ScanQrPage]
class ScanQrRoute extends _i4.PageRouteInfo<ScanQrRouteArgs> {
  ScanQrRoute({_i5.Key? key, required String eventId})
      : super(ScanQrRoute.name,
            path: '/setup/event/:eventId',
            args: ScanQrRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'ScanQrRoute';
}

class ScanQrRouteArgs {
  const ScanQrRouteArgs({this.key, required this.eventId});

  final _i5.Key? key;

  final String eventId;

  @override
  String toString() {
    return 'ScanQrRouteArgs{key: $key, eventId: $eventId}';
  }
}
