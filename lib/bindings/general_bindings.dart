import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/network_manager.dart';
import 'package:szakdolgozat_app/data/repositories/fishing_spots/fishing_spot_repository.dart';
import 'package:szakdolgozat_app/features/browsing/controllers/favourite_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(FavouriteController());
    Get.put(FishingSpotRepository());
  }
}