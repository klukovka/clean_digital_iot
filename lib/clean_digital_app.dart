import 'package:clean_digital_iot/router/app_auto_router.gr.dart';
import 'package:clean_digital_iot/router/clean_digital_observer.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'di/injection_container.dart';

class CleanDigitalApp extends StatelessWidget {
  const CleanDigitalApp({Key? key}) : super(key: key);

  ThemeData get _lightTheme {
    return FlexThemeData.light(
      scheme: FlexScheme.jungle,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
        inputDecoratorRadius: 12.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: GoogleFonts.outfit().fontFamily,
    );
  }

  ThemeData get _darkTheme {
    return FlexThemeData.dark(
      scheme: FlexScheme.jungle,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
        inputDecoratorRadius: 12.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      fontFamily: GoogleFonts.outfit().fontFamily,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      routeInformationParser: locator<AppAutoRouter>().defaultRouteParser(),
      routeInformationProvider: locator<AppAutoRouter>().routeInfoProvider(),
      routerDelegate: locator<AppAutoRouter>().delegate(
        navigatorObservers: () {
          return [CleanDigitalObserver()];
        },
      ),
    );
  }
}
