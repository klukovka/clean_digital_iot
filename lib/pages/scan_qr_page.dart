import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:clean_digital_iot/di/injection_container.dart';
import 'package:clean_digital_iot/router/clean_digital_router.dart';
import 'package:clean_digital_iot/views/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../bloc/scan_qr_page/scan_qr_page_cubit.dart';

class ScanQrPage extends StatefulWidget implements AutoRouteWrapper {
  final String eventId;

  const ScanQrPage({
    Key? key,
    @pathParam required this.eventId,
  }) : super(key: key);

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ScanQrPageCubit>(),
      child: this,
    );
  }
}

class _ScanQrPageState extends State<ScanQrPage> {
  late int _timer;
  Timer? _periodicTimer;

  ScanQrPageCubit get cubit => context.read();

  @override
  void initState() {
    super.initState();
    _timer = 65;
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
          cubit.init('eventId');
        }
      },
    );
  }

  String get _timerLabel {
    final minutes = _timer ~/ 60;
    final seconds = _timer - minutes * 60;
    return '${minutes.timeFormatted}:${seconds.timeFormatted}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCAN QR'),
      ),
      body: BlocListener<ScanQrPageCubit, ScanQrPageState>(
        listener: (context, state) {
          switch (state.status) {
            case ScanQrPageStatus.deleted:
            case ScanQrPageStatus.error:
              router.pop();
              break;

            case ScanQrPageStatus.success:
              break;

            case ScanQrPageStatus.loading:
              break;
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrettyQr(
                typeNumber: 3,
                size: 200,
                data: widget.eventId,
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true,
              ),
              const SizedBox(height: 16),
              Text(
                _timerLabel,
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        ),
      ),
      bottomSheet: const Padding(
        padding: EdgeInsets.all(16.0),
        child: PrimaryButton(
          title: 'CANCEL',
          isOutlined: true,
        ),
      ),
    );
  }
}

extension on int {
  String get timeFormatted => '$this'.padLeft(2, '0');
}
