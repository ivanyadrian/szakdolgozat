import 'package:szakdolgozat_app/features/personalization/models/counties_model.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';

class TDummyData {
  static final List<CountiesModel> counties = [
    CountiesModel(id: '1', name: 'Borsod-Abaúj-Zemplén', image: TImages.borsod_abauj_zemplen, isFeatured: true),
    CountiesModel(id: '2', name: 'Szabolcs-Szatmár-Bereg', image: TImages.szabolcs_szatmar_bereg, isFeatured: true),
    CountiesModel(id: '3', name: 'Hajdú bihar', image: TImages.hajdu_bihar, isFeatured: true),
    CountiesModel(id: '4', name: 'Békés', image: TImages.bekes, isFeatured: true),
    CountiesModel(id: '5', name: 'Bács Kiskun Szolnok', image: TImages.bacs_kiskun, isFeatured: true),
    CountiesModel(id: '6', name: 'Baranya', image: TImages.baranya, isFeatured: true),
    CountiesModel(id: '7', name: 'Heves', image: TImages.heves, isFeatured: true),
    CountiesModel(id: '8', name: 'Győr Moson Sopron', image: TImages.gyor_moson_sopron, isFeatured: true),
    CountiesModel(id: '9', name: 'Vas', image: TImages.vas, isFeatured: true),
    CountiesModel(id: '10', name: 'Veszprém', image: TImages.veszprem, isFeatured: true),
  ];
}