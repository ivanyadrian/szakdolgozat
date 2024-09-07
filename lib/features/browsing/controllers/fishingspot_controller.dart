import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/network_manager.dart';
import 'package:szakdolgozat_app/features/personalization/controllers/user_controller.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/popups/full_screen_loader.dart';
import '../../../data/repositories/fishing_spots/fishing_spot_repository.dart';
import '../screens/upload_new_element/model/fishing_spot_model.dart';

class FishingSpotController extends GetxController {
  static FishingSpotController get instance => Get.find();

  final placeName = TextEditingController();
  final waterType = TextEditingController();
  final settlementName = TextEditingController();
  final county = TextEditingController();
  final gpsCoordinates = TextEditingController();
  final numberOfSpots = TextEditingController();
  final userController = UserController.instance;
  final fishingSpotRepository = Get.put(FishingSpotRepository());
  final GlobalKey<FormState> fishingSpotFormKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  final RxList<XFile> selectedImages = <XFile>[].obs;

  /// init fishing spot data when screen appears
  @override
  void onInit() {
    super.onInit();
  }

  /// Pick images from the gallery
  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      selectedImages.value = images;
    }
  }

  /// Save fishing spot data to Firestore
  Future<void> saveFishingSpot() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Horgászhely mentése folyamatban...', TImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!fishingSpotFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      if (selectedImages.isEmpty) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'Hiba', message: 'Válassz ki legalább egy képet', duration: 2);
        return;
      }

      // Collect spot data
      final fishingSpot = FishingSpotModel(
        id: '',
        placeName: placeName.text.trim(),
        waterType: waterType.text.trim(),
        settlementName: settlementName.text.trim(),
        gpsCoordinates: gpsCoordinates.text.trim(),
        numberOfSpots: int.parse(numberOfSpots.text.trim()),
        uploadedBy: userController.user.value.username,
        imageUrls: [],
      );

      // Save fishing spot to Firestore with the county name
      final spotId = await fishingSpotRepository.createFishingSpot(fishingSpot, county.text.trim());

      // Upload images and get their URLs
      final imageUrls = await fishingSpotRepository.uploadImages(spotId, selectedImages);

      // Update Firestore with image URLs
      await fishingSpotRepository.updateFishingSpotImages(spotId, county.text.trim(), imageUrls);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success message
      TLoaders.successSnackBar(title: 'Nagyszerű', message: 'Sikeresen feltöltötted a horgászhelyet!', duration: 2);

      await Future.delayed(const Duration(seconds: 2));

      // Navigate back
      Get.back();

    } catch (e) {
      // Remove Loader and show error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString(), duration: 2);
    }
  }
}
