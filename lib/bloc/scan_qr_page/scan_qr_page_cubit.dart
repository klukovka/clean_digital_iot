import 'dart:async';
import 'dart:developer';

import 'package:clean_digital_iot/bloc/base_cubit.dart';
import 'package:clean_digital_iot/services/iot_service.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'scan_qr_page_state.dart';

@injectable
class ScanQrPageCubit extends BaseCubit<ScanQrPageState> {
  final IoTService _ioTService;

  ScanQrPageCubit(
    this._ioTService,
  ) : super(const ScanQrPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: ScanQrPageStatus.error,
    ));
  }

  Future<void> init(String eventId) async {
    await makeErrorHandledCall(() async {
      final event = await _ioTService.getEvent(eventId);
      if (event == null) {
        emit(state.copyWith(status: ScanQrPageStatus.deleted));
        return;
      }
      if (event.paidStatus) {
        final time = event.mode.time + (event.additionalMode?.time ?? 0);
        emit(state.copyWith(
          status: ScanQrPageStatus.success,
          time: time,
        ));
        return;
      }
    });
  }

  Future<void> cancel(String eventId) async {
    await makeErrorHandledCall(() async {
      _ioTService.cancelEvent(eventId);
      emit(state.copyWith(status: ScanQrPageStatus.deleted));
    });
  }
}
