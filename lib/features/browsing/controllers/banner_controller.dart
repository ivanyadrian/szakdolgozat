import 'package:get/get.dart';
import 'package:szakdolgozat_app/data/repositories/banners/banner_repository.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {

  /// Variables
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigator Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // show loader while loading counties
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}