import 'package:clean_digital_iot/api/models/events/event_response.dart';
import 'package:clean_digital_iot/api/models/events/setup_event.dart';
import 'package:clean_digital_iot/models/additional_mode.dart';
import 'package:clean_digital_iot/models/event.dart';
import 'package:clean_digital_iot/models/mode.dart';
import 'package:clean_digital_iot/models/wash_machine.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_meta.dart';
import 'api_constants.dart';
import 'models/auth/login_request.dart';

part 'clean_digital_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.host)
abstract class CleanDigitalApiClient {
  factory CleanDigitalApiClient(
    Dio dio, {
    String baseUrl,
  }) = _CleanDigitalApiClient;

  ///
  /// Auth
  ///

  @POST('/auth/login')
  Future<AuthMeta> login(
    @Body() LoginRequest body,
  );

  ///
  /// Event params
  ///

  @GET('/laundry/wash-machine-by-id/{washMachineId}')
  Future<WashMachine> getWashMachineById(
    @Path('washMachineId') String washMachineId,
  );

  @GET('/laundry/all-additional-modes-iot/{laundryId}')
  Future<List<AdditionalMode>> getAllAdditionalModes(
    @Path('laundryId') String laundryId,
  );

  @GET('/laundry/all-modes-iot/{laundryId}')
  Future<List<Mode>> getAllModes(
    @Path('laundryId') String laundryId,
  );

  ///
  /// Events
  ///

  @POST('/event/setup-event')
  Future<EventResponse> setupEvent(
    @Body() SetupEvent body,
  );

  @GET('/event/by-id/{eventId}')
  Future<Event?> getEvent(
    @Path('eventId') String eventId,
  );

  @DELETE('/event/cancel/{eventId}')
  Future<void> cancelEvent(
    @Path('eventId') String eventId,
  );
}
