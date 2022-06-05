import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ml_kit/features/ktp_ocr/presentation/pages/text_recognition.dart';
import 'features/ktp_ocr/presentation/bloc/ktp_ocr_cubit.dart';
import 'injection_container.dart';
import 'injection_container.dart' as di;

CameraDescription? cameraDescription;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final camera = await availableCameras();
  final firtsCamera = camera.first;
  cameraDescription = firtsCamera;
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<KtpOcrCubit>(),
          ),
        ],
        child: TextRecognition(cameraDescription: cameraDescription!),
      ),
    );
  }
}
