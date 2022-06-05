// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

import 'features/ktp_ocr/data/datasource/ktp_ocr_datasource.dart';
import 'features/ktp_ocr/data/datasource/ktp_ocr_datasource_impl.dart';
import 'features/ktp_ocr/data/repository/ktp_ocr_repository_impl.dart';
import 'features/ktp_ocr/domain/repository/ktp_ocr_repository.dart';
import 'features/ktp_ocr/domain/usecases/ktp_ocr_usecase.dart';
import 'features/ktp_ocr/presentation/bloc/ktp_ocr_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory(() => KtpOcrCubit(ktpOcrUseCase: sl()));
  //datasource
  sl.registerLazySingleton<KtpOcrDataSource>(
      () => KtpOcrDataSourceImpl(textRecognizer: sl()));
  //repository
  sl.registerLazySingleton<KtpOcrRepository>(
      () => KtpOcrRepositoryImpl(ktpOcrDataSource: sl()));
  //usecases
  sl.registerLazySingleton(() => KtpOcrUseCase(ktpOcrRepository: sl()));
  //image picker
  sl.registerLazySingleton(() => ImagePicker());
  //text recognizer
  sl.registerLazySingleton(() => FirebaseVision.instance.cloudTextRecognizer());
}
