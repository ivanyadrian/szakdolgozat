import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import '../../../data/repositories/counties/county_repository.dart';
import '../models/county_model.dart';

class CountyController extends GetxController {
  static CountyController get instance => Get.find();

  final isLoading = false.obs;
  final _countyRepository = Get.put(CountyRepository());
  RxList<CountyModel> allCounties = <CountyModel>[].obs;
  RxList<CountyModel> featureCounties = <CountyModel>[].obs;

  @override
  void onInit() {
    fetchCounties();
    super.onInit();
  }

  /// Load countain data
  Future<void> fetchCounties() async {
    try {
      // show loader while loading counties
      isLoading.value = true;

      // fetch counties from data source (Firestore, API, etc.)
      final counties = await _countyRepository.getAllCounties();

      // update the counties list
      allCounties.assignAll(counties);

      // filter featured counties
      featureCounties.assignAll(allCounties.where((county) => county.isFeatured && county.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}