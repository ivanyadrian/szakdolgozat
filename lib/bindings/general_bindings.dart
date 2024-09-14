import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/network_manager.dart';
import 'package:szakdolgozat_app/features/browsing/controllers/county_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(CountyController());
  }
}