// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  const ScanQrPageState({
    this.status = ScanQrPageStatus.loading,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [status, errorMessage];

  ScanQrPageState copyWith({
    ScanQrPageStatus? status,
    String? errorMessage,
  }) {
    return ScanQrPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
