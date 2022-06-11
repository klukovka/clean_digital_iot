part of 'setup_event_page_cubit.dart';

enum SetupEventPageStatus {
  loading,
  loaded,
  error,
  saving,
  saved,
}

class SetupEventPageState extends Equatable {
  final SetupEventPageStatus status;
  final String errorMessage;
  final List<AdditionalMode> additionalModes;
  final List<Mode> modes;
  final List<int> temperatures;
  final List<int> speed;
  final int costs;
  final int time;
  final String eventId;

  const SetupEventPageState({
    this.status = SetupEventPageStatus.loading,
    this.errorMessage = '',
    this.additionalModes = const [],
    this.modes = const [],
    this.temperatures = const [],
    this.speed = const [],
    this.costs = 0,
    this.time = 0,
    this.eventId = '',
  });

  SetupEventPageState copyWith({
    SetupEventPageStatus? status,
    String? errorMessage,
    List<AdditionalMode>? additionalModes,
    List<Mode>? modes,
    List<int>? temperatures,
    List<int>? speed,
    int? costs,
    int? time,
    String? eventId,
  }) {
    return SetupEventPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      additionalModes: additionalModes ?? this.additionalModes,
      modes: modes ?? this.modes,
      temperatures: temperatures ?? this.temperatures,
      speed: speed ?? this.speed,
      costs: costs ?? this.costs,
      time: time ?? this.time,
      eventId: eventId ?? this.eventId,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      errorMessage,
      additionalModes,
      modes,
      temperatures,
      speed,
      costs,
      time,
      eventId,
    ];
  }
}
