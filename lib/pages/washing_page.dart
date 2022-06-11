import 'dart:async';

import 'package:clean_digital_iot/utils/int_ext.dart';
import 'package:flutter/material.dart';

import '../router/clean_digital_router.dart';

class WashingPage extends StatefulWidget {
  final int time;
  const WashingPage({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<WashingPage> createState() => _WashingPageState();
}

class _WashingPageState extends State<WashingPage> {
  late int _timer;
  Timer? _periodicTimer;

  String get _timerLabel {
    final minutes = _timer ~/ 60;
    final seconds = _timer - minutes * 60;
    return '${minutes.timeFormatted}:${seconds.timeFormatted}';
  }

  @override
  void initState() {
    super.initState();
    _timer = widget.time * 60;
    _startTimer();
  }

  @override
  void dispose() {
    _periodicTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _periodicTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_timer < 1) {
          timer.cancel();
          router.replaceSetupEventPage();
        } else {
          setState(() {
            _timer--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              _timerLabel,
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
