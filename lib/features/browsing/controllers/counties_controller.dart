import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/features/personalization/models/counties_model.dart';

import '../../../data/repositories/counties/counties_repository.dart';

class CountiesController extends GetxController {
  static CountiesController get instance => Get.find();

  final isLoading = false.obs;
  final _countiesRepository = Get.put(CountiesRepository());
  RxList<CountiesModel> allCounties = <CountiesModel>[].obs;
  RxList<CountiesModel> featureCounties = <CountiesModel>[].obs;

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
      final counties = await _countiesRepository.getAllCounties();

      // update the counties list
      allCounties.assignAll(counties);

      // filter featured counties
      featureCounties.assignAll(allCounties.where((counties) => counties.isFeatured && counties.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}