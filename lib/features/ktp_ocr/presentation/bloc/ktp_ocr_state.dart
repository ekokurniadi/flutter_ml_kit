part of "ktp_ocr_cubit.dart";

abstract class KtpOcrState extends Equatable {
  const KtpOcrState();
  @override
  List<Object> get props => [];
}

class KtpOcrInitial extends KtpOcrState {}

class KtpOnLoading extends KtpOcrState {}

class KtpOnScanError extends KtpOcrState {}

class KtpOnScanSuccess extends KtpOcrState {
  final String message;
  final KtpDataModel ktpDataModel;

  const KtpOnScanSuccess({
    required this.message,
    required this.ktpDataModel,
  });

  @override
  List<Object> get props => [message, ktpDataModel];
}
