import 'dart:io';

import "package:dartz/dartz.dart";
import "../../../../core/error/failures.dart";
import "../../domain/repository/ktp_ocr_repository.dart";
import "../../data/datasource/ktp_ocr_datasource.dart";
import "../../data/models/ktp_data_model.dart";

class KtpOcrRepositoryImpl extends KtpOcrRepository {
  final KtpOcrDataSource _ktpOcrDataSource;

  KtpOcrRepositoryImpl({
    required KtpOcrDataSource ktpOcrDataSource,
  }) : _ktpOcrDataSource = ktpOcrDataSource;

  @override
  Future<Either<Failures, KtpDataModel>> execute(File fileImage) async {
    return await _ktpOcrDataSource.execute(fileImage);
  }
}
