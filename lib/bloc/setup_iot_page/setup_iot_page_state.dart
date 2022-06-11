part of 'setup_iot_page_cubit.dart';

enum SetupIoTPageStatus {
  initial,
  error,
  success,
  loading,
}

class SetupIoTPageState extends Equatable {
  final SetupIoTPageStatus status;
  final String errorMessage;
  final bool obscureText;

  const SetupIoTPageState({
    this.status = SetupIoTPageStatus.initial,
    this.errorMessage = '',
    this.obscureText = true,
  });

  @override
  List<Object> get props => [status, errorMessage, obscureText];

  SetupIoTPageState copyWith({
    SetupIoTPageStatus? status,
    String? errorMessage,
    bool? obscureText,
  }) {
    return SetupIoTPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
