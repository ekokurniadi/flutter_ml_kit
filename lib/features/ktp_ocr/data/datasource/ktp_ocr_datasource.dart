import 'dart:io';

import "package:dartz/dartz.dart";
import "../../../../core/error/failures.dart";
import "../../data/models/ktp_data_model.dart";

abstract class KtpOcrDataSource {
  Future<Either<Failures, KtpDataModel>> execute(File fileImage);
}
