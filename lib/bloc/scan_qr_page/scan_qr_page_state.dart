part of 'scan_qr_page_cubit.dart';

enum ScanQrPageStatus {
  loading,
  error,
  success,
  deleted,
}

class ScanQrPageState extends Equatable {
  final ScanQrPageStatus status;
  final String errorMessage;
  final int time;

  const ScanQrPageState({
    this.status = ScanQrPageStatus.loading,
    this.errorMessage = '',
    this.time = 0,
  });

  ScanQrPageState copyWith({
    ScanQrPageStatus? status,
    String? errorMessage,
    int? time,
  }) {
    return ScanQrPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      time: time ?? this.time,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, time];
}
