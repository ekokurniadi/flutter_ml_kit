import 'package:flutter/foundation.dart';

String normalizeNikText(String text) {
  String result = text.toUpperCase();

  result = result.replaceAll("NIK", "").replaceAll(":", "").trim();

  return result;
}

String normalizeNamaText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("NEMA", "")
      .replaceAll("NAME", "")
      .replaceAll(":", "")
      .trim();

  return result;
}

String normalizeJenisKelaminText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("GOL. DARAHO", "")
      .replaceAll("GOL. DARAH", "")
      .replaceAll("GOL DARAH", "")
      .replaceAll("LAKFEARI", "")
      .replaceAll("LAKFLAK", "")
      .replaceAll("KELAMIN", "")
      .replaceAll("KEIAMIN", "")
      .replaceAll("JENIS", "")
      .replaceAll("DENIS", "")
      .replaceAll("DARAH ", "")
      .replaceAll("ENIS", "")
      .replaceAll("DARA", "")
      .replaceAll("GO", "")
      .replaceAll("L. ", "")
      .replaceAll(" H0", "")
      .replaceAll(" HO", "")
      .replaceAll(":", "")
      .replaceAll(" 0", "")
      .replaceAll(" O", "")
      .trim();

  if (result == "LAK-LAK" ||
      result == "LAKI-LAK" ||
      result == "AK-LAK" ||
      result == "LAKFLAKI" ||
      result == "LAKHLAK" ||
      result == "LAKFEAKI" ||
      result == "LAKELAKI" ||
      result == "LAKELAK" ||
      result == "LAKHLAKI" ||
      result == "LAKHEAK" ||
      result == "LAK-LAKI" ||
      result == "LAKHEAKI" ||
      result == "LAKIFEAK" ||
      result == "LAKFEAKE" ||
      result == "LAKIFEAKI" ||
      result == "LAKFEAR" ||
      result == "LAKFLAK" ||
      result == "LAK-LAKE" ||
      result == "LAK-EAK" ||
      result == "LAKFEAK" ||
      result == "LAK-EAKI" ||
      result == "LAKI_LAKI L,A" ||
      result == "LAKELAKE") {
    return "Laki-Laki";
  }

  return result;
}

String normalizeAlamatText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("RI/KEILDESAA", "")
      .replaceAll("Dosa", "Desa")
      .replaceAll("Kei", "Kel")
      .replaceAll("RTKELIIDESAA", "")
      .replaceAll("TIKEL/LDESA", "")
      .replaceAll("RTKEL/DESAA", "")
      .replaceAll("RTKELVDESA", "")
      .replaceAll("RIKELBESAA", "")
      .replaceAll("KECAMATAN", "")
      .replaceAll("KEL/DESSA", "")
      .replaceAll("KELIDESAA", "")
      .replaceAll("KELI/DESA", "")
      .replaceAll("KELILDESA", "")
      .replaceAll("KELIIDESA", "")
      .replaceAll("KELILDESA", "")
      .replaceAll("KEL/ DESA", "")
      .replaceAll("KELLIDESA", "")
      .replaceAll("KECAMATDN", "")
      .replaceAll("HECAMATAN", "")
      .replaceAll("KEILIBESA", "")
      .replaceAll("KELILBESA", "")
      .replaceAll("NECAMATAN", "")
      .replaceAll("KELL/DESA", "")
      .replaceAll("KEL/DESAA", "")
      .replaceAll("KELLDESAA", "")
      .replaceAll("KEL/DESA", "")
      .replaceAll("KELLIBES", "")
      .replaceAll("KEI/DESA", "")
      .replaceAll("HELLDESA", "")
      .replaceAll("KELIBESA", "")
      .replaceAll("KELLBESA", "")
      .replaceAll("KEL/DESA", "")
      .replaceAll("KELLDESA", "")
      .replaceAll("KEILDESA", "")
      .replaceAll("KEILBESA", "")
      .replaceAll("KELIDESA", "")
      .replaceAll("KEVDESA", "")
      .replaceAll("KEVBESA", "")
      .replaceAll("KELBESA", "")
      .replaceAll("KE/DESA", "")
      .replaceAll("ELLDESA", "")
      .replaceAll("KELDESA", "")
      .replaceAll("ALAMAT", "")
      .replaceAll("LAMAT", "")
      .replaceAll("RTIRW", "")
      .replaceAll("RT/RW", "")
      .replaceAll("ELDESA", "")
      .replaceAll("KEVDES", "")
      .replaceAll("RTIRWN", "")
      .replaceAll(" TIA ", " ")
      .replaceAll("RT ", "")
      .replaceAll("RT/ ", "")
      .replaceAll("RW ", "")
      .replaceAll(":", "")
      .replaceAll("=", "")
      .replaceAll("  ", " ")
      .trim();

  if (kDebugMode) {
    print("result result result result result " + result);
  }

  return result;
}

String normalizeKawinText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("PERKAWINAN", "")
      .replaceAll("PERKAWINA", "")
      .replaceAll("STATUS", "")
      .replaceAll("TATUS", "")
      .replaceAll("STAFUS", "")
      .replaceAll("R ", "")
      .replaceAll("T ", "")
      .replaceAll(":", "")
      .trim();

  return result;
}

String normalizePekerjaanText(String text) {
  String result = text.toUpperCase();

  result = result.replaceAll("PEKERJAAN", "").replaceAll(":", "").trim();

  if (result == "PELAJARIMAHASISSWA" ||
      result == "PELAJARIMAHASISWA" ||
      result == "PELAJARIMAHASISVWA" ||
      result == "PELAJARMAHASISWA") {
    return "Pelajar/Mahasiswa";
  }
  return result;
}

String normalizeKewarganegaraanText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("KEWARGANEGARAAN", "")
      .replaceAll("EUMUR", "")
      .replaceAll("HDUP", "")
      .replaceAll("H ", "")
      .replaceAll("N ", "")
      .replaceAll(":", "")
      .trim();

  return result;
}

String normalizeAgamaText(String text) {
  String result = text.toUpperCase();

  result = result
      .replaceAll("AGAMA", "")
      .replaceAll(":", "")
      .replaceAll("GAMA", "")
      .trim();

  if (result == "SLAM" ||
      result == "AM" ||
      result == "SLA AM" ||
      result == "ISLU AM" ||
      result == "SL LAM" ||
      result == "ISLAME" ||
      result == "SLA M" ||
      result == "ISL AM" ||
      result == "ISLA AM" ||
      result == "S AM" ||
      result == "SLL AM" ||
      result == "SL AM" ||
      result == "SE AM" ||
      result == "1SLAM" ||
      result == "ISLAMM" ||
      result == "SLA" ||
      result == "LAM") {
    result = "Islam";
  }

  if (result.trim().isEmpty) {
    return "";
  } else {
    return result;
  }
}
