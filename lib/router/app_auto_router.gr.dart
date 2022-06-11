// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/scan_qr_page.dart' as _i3;
import '../pages/setup_event_page.dart' as _i2;
import '../pages/setup_iot_page.dart' as _i1;
import '../pages/washing_page.dart' as _i4;

class AppAutoRouter extends _i5.RootStackRouter {
  AppAutoRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SetupIotRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.SetupIotPage(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    SetupEventRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.SetupEventPage(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ScanQrRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ScanQrRouteArgs>(
          orElse: () =>
              ScanQrRouteArgs(eventId: pathParams.getString('eventId')));
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.ScanQrPage(key: args.key, eventId: args.eventId),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    WashingRoute.name: (routeData) {
      final args = routeData.argsAs<WashingRouteArgs>();
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.WashingPage(key: args.key, time: args.time),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/setup/iot', fullMatch: true),
        _i5.RouteConfig(SetupIotRoute.name, path: '/setup/iot'),
        _i5.RouteConfig(SetupEventRoute.name, path: '/setup/event'),
        _i5.RouteConfig(ScanQrRoute.name, path: '/setup/event/:eventId'),
        _i5.RouteConfig(WashingRoute.name, path: '/washing')
      ];
}

/// generated route for
/// [_i1.SetupIotPage]
class SetupIotRoute extends _i5.PageRouteInfo<void> {
  const SetupIotRoute() : super(SetupIotRoute.name, path: '/setup/iot');

  static const String name = 'SetupIotRoute';
}

/// generated route for
/// [_i2.SetupEventPage]
class SetupEventRoute extends _i5.PageRouteInfo<void> {
  const SetupEventRoute() : super(SetupEventRoute.name, path: '/setup/event');

  static const String name = 'SetupEventRoute';
}

/// generated route for
/// [_i3.ScanQrPage]
class ScanQrRoute extends _i5.PageRouteInfo<ScanQrRouteArgs> {
  ScanQrRoute({_i6.Key? key, required String eventId})
      : super(ScanQrRoute.name,
            path: '/setup/event/:eventId',
            args: ScanQrRouteArgs(key: key, eventId: eventId),
            rawPathParams: {'eventId': eventId});

  static const String name = 'ScanQrRoute';
}

class ScanQrRouteArgs {
  const ScanQrRouteArgs({this.key, required this.eventId});

  final _i6.Key? key;

  final String eventId;

  @override
  String toString() {
    return 'ScanQrRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i4.WashingPage]
class WashingRoute extends _i5.PageRouteInfo<WashingRouteArgs> {
  WashingRoute({_i6.Key? key, required int time})
      : super(WashingRoute.name,
            path: '/washing', args: WashingRouteArgs(key: key, time: time));

  static const String name = 'WashingRoute';
}

class WashingRouteArgs {
  const WashingRouteArgs({this.key, required this.time});

  final _i6.Key? key;

  final int time;

  @override
  String toString() {
    return 'WashingRouteArgs{key: $key, time: $time}';
  }
}
