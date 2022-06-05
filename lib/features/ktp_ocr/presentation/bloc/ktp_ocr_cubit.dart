import 'dart:io';

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "../../domain/usecases/ktp_ocr_usecase.dart";
import "../../data/models/ktp_data_model.dart";
part "ktp_ocr_state.dart";

class KtpOcrCubit extends Cubit<KtpOcrState> {
  final KtpOcrUseCase _ktpOcrUseCase;

  KtpOcrCubit({
    required KtpOcrUseCase ktpOcrUseCase,
  })  : _ktpOcrUseCase = ktpOcrUseCase,
        super(KtpOcrInitial());

  Future<void> scanKtp(File fileImage) async {
    emit(KtpOnLoading());
    final result = await _ktpOcrUseCase.call(fileImage);
    result.fold((failures) {
      emit(KtpOnScanError());
    }, (response) {
      emit(KtpOnScanSuccess(message: "Success", ktpDataModel: response));
    });
  }
}
