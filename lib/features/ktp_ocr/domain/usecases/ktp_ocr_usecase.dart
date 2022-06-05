import 'dart:io';

import "package:dartz/dartz.dart";
import "package:equatable/equatable.dart";
import "../../../../core/error/failures.dart";
import "../../../../core/usecases/usecases.dart";
import "../../domain/repository/ktp_ocr_repository.dart";
import "../../data/models/ktp_data_model.dart";

class KtpOcrUseCase implements UseCase<KtpDataModel, File> {
  final KtpOcrRepository _ktpOcrRepository;

  KtpOcrUseCase({
    required KtpOcrRepository ktpOcrRepository,
  }) : _ktpOcrRepository = ktpOcrRepository;

  @override
  Future<Either<Failures, KtpDataModel>> call(File fileImage) async {
    final result = await _ktpOcrRepository.execute(fileImage);

    return result;
  }
}

class Params extends Equatable {
  const Params();
  @override
  List<Object?> get props => [];
}
