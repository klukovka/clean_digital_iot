import 'package:clean_digital_iot/services/iot_service.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../base_cubit.dart';

part 'setup_iot_page_state.dart';

@injectable
class SetupIoTPageCubit extends BaseCubit<SetupIoTPageState> {
  final IoTService _ioTService;

  SetupIoTPageCubit(
    this._ioTService,
  ) : super(const SetupIoTPageState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      errorMessage: errorMessage,
      status: SetupIoTPageStatus.error,
    ));
  }

  void changeObscureText() {
    emit(state.copyWith(
      obscureText: !state.obscureText,
      status: SetupIoTPageStatus.initial,
    ));
  }

  Future<void> login(
    String email,
    String password,
    String washMachineId,
  ) async {
    emit(state.copyWith(status: SetupIoTPageStatus.loading));

    await makeErrorHandledCall(() async {
      await _ioTService.login(
        email,
        password,
        washMachineId,
      );

      emit(state.copyWith(status: SetupIoTPageStatus.success));
    });
  }
}
