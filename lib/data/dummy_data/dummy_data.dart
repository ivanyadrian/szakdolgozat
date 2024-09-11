import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import '../../features/browsing/models/county_model.dart';

class TDummyData {
  static final List<CountyModel> counties = [
    CountyModel(id: '1', name: 'Borsod-Abaúj-Zemplén', image: TImages.borsod_abauj_zemplen, isFeatured: true),
    CountyModel(id: '2', name: 'Szabolcs-Szatmár-Bereg', image: TImages.szabolcs_szatmar_bereg, isFeatured: true),
    CountyModel(id: '3', name: 'Hajdú bihar', image: TImages.hajdu_bihar, isFeatured: true),
    CountyModel(id: '4', name: 'Békés', image: TImages.bekes, isFeatured: true),
    CountyModel(id: '5', name: 'Bács Kiskun Szolnok', image: TImages.bacs_kiskun, isFeatured: true),
    CountyModel(id: '6', name: 'Baranya', image: TImages.baranya, isFeatured: true),
    CountyModel(id: '7', name: 'Heves', image: TImages.heves, isFeatured: true),
    CountyModel(id: '8', name: 'Győr Moson Sopron', image: TImages.gyor_moson_sopron, isFeatured: true),
    CountyModel(id: '9', name: 'Vas', image: TImages.vas, isFeatured: true),
    CountyModel(id: '10', name: 'Veszprém', image: TImages.veszprem, isFeatured: true),
  ];
}