import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}