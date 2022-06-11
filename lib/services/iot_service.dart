import 'dart:developer';

import 'package:clean_digital_iot/api/clean_digital_api_client.dart';
import 'package:clean_digital_iot/services/base_service.dart';
import 'package:clean_digital_iot/services/preferences_service.dart';
import 'package:injectable/injectable.dart';

import '../api/models/auth/login_request.dart';
import '../api/models/events/event_response.dart';
import '../api/models/events/setup_event.dart';
import '../models/additional_mode.dart';
import '../models/event.dart';
import '../models/mode.dart';
import '../models/wash_machine.dart';

@injectable
class IoTService extends BaseService {
  final CleanDigitalApiClient _apiClient;
  final PreferencesService _preferencesService;

  IoTService(
    this._apiClient,
    this._preferencesService,
  );

  ///
  /// Auth
  ///

  Future<void> login(
    String email,
    String password,
    String washMachineId,
  ) async {
    return await makeErrorHandledCall(() async {
      final meta = await _apiClient.login(LoginRequest(
        email: email,
        password: password,
      ));
      await _preferencesService.setAccessToken(meta.token);
      await _preferencesService.setWashingMachine(washMachineId);
    });
  }

  ///
  /// Event params
  ///

  Future<WashMachine> getWashMachine() async {
    return await makeErrorHandledCall(() async {
      final washMachine = await _apiClient.getWashMachineById(
        _preferencesService.getWashingMachine(),
      );
      await _preferencesService.setLaundry(washMachine.laundryId);
      return washMachine;
    });
  }

  Future<List<AdditionalMode>> getAllAdditionalModes() async {
    return await _apiClient.getAllAdditionalModes(
      _preferencesService.getLaundry(),
    );
  }

  Future<List<Mode>> getAllModes() async {
    return await _apiClient.getAllModes(
      _preferencesService.getLaundry(),
    );
  }

  ///
  /// Events
  ///

  Future<EventResponse> setupEvent(SetupEvent body) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.setupEvent(body);
    });
  }

  Future<Event?> getEvent(String eventId) async {
    return await makeErrorHandledCall(() async {
      return await _apiClient.getEvent(eventId);
    });
  }

  Future<void> cancelEvent(String eventId) async {
    return await makeErrorHandledCall(() async {
      await _apiClient.cancelEvent(eventId);
    });
  }
}
