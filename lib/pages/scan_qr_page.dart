import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:clean_digital_iot/di/injection_container.dart';
import 'package:clean_digital_iot/router/clean_digital_router.dart';
import 'package:clean_digital_iot/utils/int_ext.dart';
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

  String get _timerLabel {
    final minutes = _timer ~/ 60;
    final seconds = _timer - minutes * 60;
    return '${minutes.timeFormatted}:${seconds.timeFormatted}';
  }

  @override
  void initState() {
    super.initState();
    _timer = 900;
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
      (timer) async {
        if (_timer < 1) {
          timer.cancel();
          router.replaceSetupEventPage();
        } else {
          setState(() {
            _timer--;
          });
          await cubit.init(widget.eventId);
        }
      },
    );
  }

  void _onStateChanged(
    BuildContext context,
    ScanQrPageState state,
  ) {
    switch (state.status) {
      case ScanQrPageStatus.deleted:
      case ScanQrPageStatus.error:
        router.pop();
        break;

      case ScanQrPageStatus.success:
        router.replaceWashingPage(state.time);
        break;

      case ScanQrPageStatus.loading:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCAN QR'),
      ),
      body: BlocListener<ScanQrPageCubit, ScanQrPageState>(
        listener: _onStateChanged,
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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PrimaryButton(
          title: 'CANCEL',
          isOutlined: true,
          onPressed: () {
            cubit.cancel(widget.eventId);
            router.replaceSetupEventPage();
          },
        ),
      ),
    );
  }
}
