import 'package:clean_digital_iot/clean_digital_app.dart';
import 'package:clean_digital_iot/di/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const CleanDigitalApp());
}
