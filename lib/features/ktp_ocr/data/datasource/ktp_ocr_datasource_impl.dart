// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:ui';

import "package:dartz/dartz.dart";
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_firebase_ml_kit/features/ktp_ocr/data/mapper/detector.dart';
import 'package:flutter_firebase_ml_kit/features/ktp_ocr/data/mapper/ktp_data_mapper.dart';

import "../../../../core/error/failures.dart";
import "../../data/models/ktp_data_model.dart";
import "ktp_ocr_datasource.dart";

class KtpOcrDataSourceImpl extends KtpOcrDataSource {
  final TextRecognizer textRecognizer;

  KtpOcrDataSourceImpl({required this.textRecognizer});

  @override
  Future<Either<Failures, KtpDataModel>> execute(File fileImage) async {
    final image = FirebaseVisionImage.fromFile(fileImage);
    final visionText = await textRecognizer.processImage(image);
    String nikResult = "";
    String nameResult = "";
    String tempatLahirResult = "";
    String tglLahirResult = "";
    String jenisKelaminResult = "";
    String alamatFullResult = "";
    String alamatResult = "";
    String rtrwResult = "";
    String kelDesaResult = "";
    String kecamatanResult = "";
    String agamaResult = "";
    String statusKawinResult = "";
    String pekerjaanResult = "";
    String kewarganegaraanResult = "";

    Rect? nikRect;
    Rect? namaRect;
    Rect? alamatRect;
    Rect? rtrwRect;
    Rect? kelDesaRect;
    Rect? kecamatanRect;
    Rect? jenisKelaminRect;
    Rect? tempatTanggalLahirRect;
    Rect? agamaRect;
    Rect? statusKawinRect;
    Rect? pekerjaanRect;
    Rect? kewarganegaraanRect;
    try {
      for (int i = 0; i < visionText.blocks.length; i++) {
        for (int j = 0; j < visionText.blocks[i].lines.length; j++) {
          for (int k = 0;
              k < visionText.blocks[i].lines[j].elements.length;
              k++) {
            final data = visionText.blocks[i].lines[j].elements[k];

            print("b$i l$j e$k " +
                data.text.toLowerCase().trim().replaceAll(" ", "") +
                " " +
                data.boundingBox.center.toString());

            if (checkNikField(data.text)) {
              nikRect = data.boundingBox;
              print("nik field detected");
            }

            if (checkNamaField(data.text)) {
              namaRect = data.boundingBox;
              print("nama field detected");
            }

            if (checkTglLahirField(data.text)) {
              tempatTanggalLahirRect = data.boundingBox;
              print("tempat tgllahir field detected");
            }

            if (checkJenisKelaminField(data.text)) {
              jenisKelaminRect = data.boundingBox;
              print("jenis kelamin field detected");
            }

            if (checkAlamatField(data.text)) {
              alamatRect = data.boundingBox;
              print("alamat field detected");
            }

            if (checkRtRwField(data.text)) {
              rtrwRect = data.boundingBox;
              print("RT/RW field detected");
            }

            if (checkKelDesaField(data.text)) {
              kelDesaRect = data.boundingBox;
              print("kelurahan / desa field detected");
            }

            if (checkKecamatanField(data.text)) {
              kecamatanRect = data.boundingBox;
              print("kecamatan field detected");
            }

            if (checkAgamaField(data.text)) {
              agamaRect = data.boundingBox;
              print("agama field detected");
            }

            if (checkKawinField(data.text)) {
              statusKawinRect = data.boundingBox;
              print("statusKawin field detected");
            }

            if (checkPekerjaanField(data.text)) {
              pekerjaanRect = data.boundingBox;
              print("pekerjaan field detected");
            }

            if (checkKewarganegaraanField(data.text)) {
              kewarganegaraanRect = data.boundingBox;
              print("kewarganegaraan field detected");
            }
          }
        }
      }
    } catch (e) {
      print(e);
      return left(ServerFailure());
    }

    try {
      for (int i = 0; i < visionText.blocks.length; i++) {
        for (int j = 0; j < visionText.blocks[i].lines.length; j++) {
          final data = visionText.blocks[i].lines[j];

          if (isInside(data.boundingBox, nikRect)) {
            nikResult = nikResult + " " + data.text;
            print("------ nik");
            print(nikResult);
          }

          if (isInside3rect(
              isThisRect: data.boundingBox,
              isInside: namaRect,
              andAbove: tempatTanggalLahirRect)) {
            if (data.text.toLowerCase() != "nama") {
              print("------ name");
              nameResult = (nameResult + " " + data.text).trim();
              print(nameResult);
            }
          }

          if (isInside(data.boundingBox, tempatTanggalLahirRect)) {
            final temp = data.text.replaceAll("Tempat/Tgi Lahir", "");
            tempatLahirResult = temp.substring(0, temp.indexOf(',') + 1);
            print("------ tempat lahir");
            print(tempatLahirResult);
          }

          if (isInside(data.boundingBox, tempatTanggalLahirRect)) {
            final temp = data.text.replaceAll("Tempat/Tgi Lahir", "");
            final result = temp.substring(0, temp.indexOf(',') + 1);
            print(result);
            if (result.isNotEmpty) {
              tglLahirResult =
                  temp.replaceAll(result, "").replaceAll(":", "").trim();
            }

            print("------ tgllahir");
            print(tglLahirResult);
          }

          if (isInside(data.boundingBox, jenisKelaminRect)) {
            jenisKelaminResult = jenisKelaminResult + " " + data.text;
            print("------ jenis kelamin ");
            print(rtrwResult);
          }

          if (isInside3rect(
              isThisRect: data.boundingBox,
              isInside: alamatRect,
              andAbove: agamaRect)) {
            alamatFullResult = alamatFullResult + " " + data.text;
            print("------ alamat");
            print(alamatFullResult);
          }

          if (isInside(data.boundingBox, alamatRect)) {
            alamatResult = alamatResult + " " + data.text;
            print("------ alamat  ");
            print(alamatResult);
          }

          if (isInside(data.boundingBox, rtrwRect)) {
            rtrwResult = rtrwResult + " " + data.text;
            print("------ rt rw ");
            print(rtrwResult);
          }

          if (isInside(data.boundingBox, kelDesaRect)) {
            kelDesaResult = kelDesaResult + " " + data.text;
            print("------ keldesa");
            print(kelDesaResult);
          }

          if (isInside(data.boundingBox, kecamatanRect)) {
            kecamatanResult = kecamatanResult + " " + data.text;
            print("------ kecamatan");
            print(kecamatanResult);
          }

          if (isInside(data.boundingBox, agamaRect)) {
            agamaResult = agamaResult + " " + data.text;
            print("------ agama : $agamaResult");
          }

          if (isInside(data.boundingBox, statusKawinRect)) {
            statusKawinResult = statusKawinResult + " " + data.text;
            print("------ status kawin result ");
            print(statusKawinResult);
          }

          if (isInside(data.boundingBox, pekerjaanRect)) {
            pekerjaanResult = pekerjaanResult + " " + data.text;
            print("------ status pekerjaan result ");
            print(pekerjaanResult);
          }

          if (isInside(data.boundingBox, kewarganegaraanRect)) {
            kewarganegaraanResult = kewarganegaraanResult + " " + data.text;
            print("------ status kewarganegaraan result ");
            print(kewarganegaraanResult);
          }
        }
      }
    } catch (e) {
      print(e);
      throw Exception("iteration failed ");
    }

    final result = KtpDataEntityMapper.from(
        namaLengkap: nameResult,
        tanggalLahir: tglLahirResult,
        alamatFull: alamatFullResult,
        agama: agamaResult,
        statusPerkawinan: statusKawinResult,
        pekerjaan: pekerjaanResult,
        nik: nikResult,
        kewarganegaraan: kewarganegaraanResult,
        golDarah: "null",
        tempatLahir: tempatLahirResult,
        berlakuHingga: "null",
        jenisKelamin: jenisKelaminResult,
        alamat: alamatResult,
        kecamatan: kecamatanResult,
        kelDesa: kelDesaResult,
        rtrw: rtrwResult);

    return right(result);
  }
}
