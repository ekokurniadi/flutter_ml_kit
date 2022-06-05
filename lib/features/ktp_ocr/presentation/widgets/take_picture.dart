import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ml_kit/features/ktp_ocr/presentation/bloc/ktp_ocr_cubit.dart';
import 'package:flutter_firebase_ml_kit/features/ktp_ocr/presentation/pages/detail_text_recognition.dart';

class TakePicture extends StatefulWidget {
  final CameraDescription cameraDescription;
  const TakePicture({Key? key, required this.cameraDescription})
      : super(key: key);

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late File file;

  @override
  void initState() {
    _controller =
        CameraController(widget.cameraDescription, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<KtpOcrCubit, KtpOcrState>(
      listener: (context, state) {
        if (state is KtpOnScanSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailTextRecognition(
                ktpDataModel: state.ktpDataModel,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(children: [
                CameraPreview(_controller),
                const FocusRectangle(
                  color: Colors.cyan,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.045),
                      child: Text(
                        "Place your ID Card within the box",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final image = await _controller.takePicture();
              file = File(image.path);
              BlocProvider.of<KtpOcrCubit>(context).scanKtp(file);
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}

class FocusRectangle extends StatelessWidget {
  final Color? color;

  const FocusRectangle({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: AspectRatio(
                  aspectRatio: (1.56 / 1),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: color ?? Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        )
      ],
    );
  }
}
