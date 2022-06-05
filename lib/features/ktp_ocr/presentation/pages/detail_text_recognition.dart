import 'package:flutter/material.dart';
import 'package:flutter_firebase_ml_kit/core/constant/constant_helper.dart';
import 'package:flutter_firebase_ml_kit/features/ktp_ocr/data/models/ktp_data_model.dart';

class DetailTextRecognition extends StatelessWidget {
  final KtpDataModel _ktpDataModel;
  const DetailTextRecognition({Key? key, required KtpDataModel ktpDataModel})
      : _ktpDataModel = ktpDataModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nikController = TextEditingController();
    TextEditingController namaLengkapController = TextEditingController();
    TextEditingController tempatLahirController = TextEditingController();
    TextEditingController tanggalLahirController = TextEditingController();
    TextEditingController jenisKelaminController = TextEditingController();
    TextEditingController golDarahController = TextEditingController();
    TextEditingController alamatFullController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController rtrwController = TextEditingController();
    TextEditingController kelDesaController = TextEditingController();
    TextEditingController kecamatanController = TextEditingController();
    TextEditingController agamaController = TextEditingController();
    TextEditingController statusPerkawinanController = TextEditingController();
    TextEditingController pekerjaanController = TextEditingController();
    TextEditingController kewarganegaraanController = TextEditingController();
    TextEditingController berlakuHinggaController = TextEditingController();

    void modelToTextEditing() {
      nikController.text = _ktpDataModel.nik ?? "";
      namaLengkapController.text = _ktpDataModel.namaLengkap ?? "";
      tempatLahirController.text = _ktpDataModel.tempatLahir ?? "";
      tanggalLahirController.text = _ktpDataModel.tanggalLahir ?? "";
      jenisKelaminController.text = _ktpDataModel.jenisKelamin ?? "";
      golDarahController.text = _ktpDataModel.golDarah ?? "";
      alamatFullController.text = _ktpDataModel.alamatFull ?? "";
      alamatController.text = _ktpDataModel.alamat ?? "";
      rtrwController.text = _ktpDataModel.rtrw ?? "";
      kelDesaController.text = _ktpDataModel.kelDesa ?? "";
      kecamatanController.text = _ktpDataModel.kecamatan ?? "";
      agamaController.text = _ktpDataModel.agama ?? "";
      statusPerkawinanController.text = _ktpDataModel.statusPerkawinan ?? "";
      pekerjaanController.text = _ktpDataModel.pekerjaan ?? "";
      kewarganegaraanController.text = _ktpDataModel.kewarganegaraan ?? "";
      berlakuHinggaController.text = _ktpDataModel.berlakuHingga ?? "";
    }

    modelToTextEditing();

    Widget inputText(TextEditingController controller, String label) {
      return Container(
        margin: const EdgeInsets.only(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.person_pin,
                      color: primaryColor,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {},
                      controller: controller,
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration.collapsed(
                          hintText: label,
                          hintStyle: TextStyle(color: darkGreyColor)),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Text Recognition"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  inputText(nikController, "NIK"),
                  inputText(namaLengkapController, "Nama Lengkap"),
                  inputText(tempatLahirController, "Tempat Lahir"),
                  inputText(tanggalLahirController, "Tanggal Lahir"),
                  inputText(jenisKelaminController, "Jenis Kelamin"),
                  inputText(golDarahController, "Golongan Darah"),
                  inputText(alamatFullController, "Alamat Lengkap"),
                  inputText(alamatController, "Alamat"),
                  inputText(rtrwController, "RT/RW"),
                  inputText(kelDesaController, "Kel/Desa"),
                  inputText(kecamatanController, "Kecamatan"),
                  inputText(agamaController, "Agama"),
                  inputText(statusPerkawinanController, "Status Perkawinan"),
                  inputText(pekerjaanController, "Pekerjaan"),
                  inputText(kewarganegaraanController, "Kewarganegaraan"),
                  inputText(berlakuHinggaController, "Berlaku Hingga"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
