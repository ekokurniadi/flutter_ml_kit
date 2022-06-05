import "package:equatable/equatable.dart";

class KtpDataEntity extends Equatable {
  final String? nik;
  final String? namaLengkap;
  final String? tempatLahir;
  final String? tanggalLahir;
  final String? jenisKelamin;
  final String? golDarah;
  final String? alamatFull;
  final String? alamat;
  final String? rtrw;
  final String? kelDesa;
  final String? kecamatan;
  final String? agama;
  final String? statusPerkawinan;
  final String? pekerjaan;
  final String? kewarganegaraan;
  final String? berlakuHingga;

  const KtpDataEntity({
    required this.nik,
    required this.namaLengkap,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.golDarah,
    required this.alamatFull,
    required this.alamat,
    required this.rtrw,
    required this.kelDesa,
    required this.kecamatan,
    required this.agama,
    required this.statusPerkawinan,
    required this.pekerjaan,
    required this.kewarganegaraan,
    required this.berlakuHingga,
  });

  @override
  List<Object?> get props => [
        nik,
        namaLengkap,
        tempatLahir,
        tanggalLahir,
        jenisKelamin,
        golDarah,
        alamatFull,
        alamat,
        rtrw,
        kelDesa,
        kecamatan,
        agama,
        statusPerkawinan,
        pekerjaan,
        kewarganegaraan,
        berlakuHingga,
      ];
}
