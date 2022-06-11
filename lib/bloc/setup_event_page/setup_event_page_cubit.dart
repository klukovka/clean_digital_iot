import 'package:clean_digital_iot/api/models/events/setup_event.dart';
import 'package:clean_digital_iot/bloc/base_cubit.dart';
import 'package:clean_digital_iot/models/additional_mode.dart';
import 'package:clean_digital_iot/services/iot_service.dart';
import 'package:clean_digital_iot/services/preferences_service.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../models/mode.dart';

part 'setup_event_page_state.dart';

@injectable
class SetupEventPageCubit extends BaseCubit<SetupEventPageState> {
  final IoTService _ioTService;
  final PreferencesService _preferencesService;

  SetupEventPageCubit(
    this._ioTService,
    this._preferencesService,
  ) : super(const SetupEventPageState()) {
    init();
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: SetupEventPageStatus.error,
    ));
  }

  Future<void> init() async {
    emit(state.copyWith(status: SetupEventPageStatus.loading));

    await makeErrorHandledCall(() async {
      final washMachine = await _ioTService.getWashMachine();
      final additionalModes = await _ioTService.getAllAdditionalModes();
      final modes = await _ioTService.getAllModes();
      const temperature = [30, 40, 50, 60];
      int speed = washMachine.spinningSpeed;
      List<int> speeds = [];
      while (speed > 500) {
        speeds.add(speed);
        speed -= 100;
      }
      emit(state.copyWith(
        additionalModes: additionalModes,
        modes: modes,
        temperatures: temperature,
        speed: speeds,
        status: SetupEventPageStatus.loaded,
      ));
    });
  }

  void changeCostsAndTime({
    Mode? mode,
    AdditionalMode? additionalMode,
  }) {
    final time = (mode?.time ?? 0) + (additionalMode?.time ?? 0);
    final costs = (mode?.costs ?? 0) + (additionalMode?.costs ?? 0);
    emit(state.copyWith(time: time, costs: costs));
  }

  void reset() {
    emit(state.copyWith(costs: 0, time: 0));
  }

  Future<void> save({
    required Mode mode,
    required int spinning,
    required int temperature,
    AdditionalMode? additionalMode,
  }) async {
    emit(state.copyWith(status: SetupEventPageStatus.saving));
    await makeErrorHandledCall(() async {
      final event = await _ioTService.setupEvent(SetupEvent(
        washMachineId: _preferencesService.getWashingMachine(),
        modeId: mode.modeId,
        spinning: spinning,
        temperature: temperature,
        additionalModeId: additionalMode?.additionalModeId,
      ));
      emit(state.copyWith(
        status: SetupEventPageStatus.saved,
        eventId: event.eventId,
      ));
    });
  }
}
