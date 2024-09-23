import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';

class CountyImageProvider {
  static String getImagePath(String countyName) {
    switch (countyName) {
      case 'Borsod-Abaúj-Zemplén':
        return TImages.borsod_abauj_zemplen;
      case 'Heves':
        return TImages.heves;
      case 'Budapest':
        return TImages.budapest;
      case 'Baranya':
        return TImages.baranya;
      case 'Vas':
        return TImages.vas;
      case 'Veszprém':
        return TImages.veszprem;
      case 'Zala':
        return TImages.zala;
      case 'Somogy':
        return TImages.somogy;
      case 'Tolna':
        return TImages.tolna;
      case 'Bács-Kiskun':
        return TImages.bacs_kiskun;
      case 'Békés':
        return TImages.bekes;
      case 'Csongrád-Csanád':
        return TImages.csongrad;
      case 'Fejér':
        return TImages.fejer;
      case 'Győr-Moson-Sopron':
        return TImages.gyor_moson_sopron;
      case 'Hajdú-Bihar':
        return TImages.hajdu_bihar;
      case 'Jász-Nagykun-Szolnok':
        return TImages.jasz_nagykun;
      case 'Komárom-Esztergom':
        return TImages.komarom_esztergom;
      case 'Nógrád':
        return TImages.nograd;
      case 'Pest':
        return TImages.pest;
      case 'Szabolcs-Szatmár-Bereg':
        return TImages.szabolcs_szatmar_bereg;
      case 'Tolna':
        return TImages.tolna;
      case 'Vas':
        return TImages.vas;
      case 'Zala':
        return TImages.zala;
      default:
        return TImages.placeholder;
    }
  }
}
