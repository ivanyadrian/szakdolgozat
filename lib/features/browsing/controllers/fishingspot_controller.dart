import 'package:cloud_firestore/cloud_firestore.dart';
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
  final county = TextEditingController(); // Megye neve
  final gpsCoordinates = TextEditingController();
  final numberOfSpots = TextEditingController();
  final description =  TextEditingController();
  final userController = UserController.instance;
  final fishingSpotRepository = Get.put(FishingSpotRepository());
  final GlobalKey<FormState> fishingSpotFormKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  final RxList<XFile> selectedImages = <XFile>[].obs;

  final RxList<String> counties = <String>[].obs; // Megyék listája
  final RxMap<String, Map<String, int>> countyWaterTypeData = <String, Map<String, int>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCounties();
  }

  Future<void> loadFishingSpotsByCounty(String countyName) async {
    try {
      // Lekérjük a megye ID-ját a megye neve alapján
      final countyQuery = await FirebaseFirestore.instance
          .collection('Counties')
          .where('name', isEqualTo: countyName)
          .limit(1)
          .get();

      if (countyQuery.docs.isEmpty) {
        throw Exception('Megye nem található');
      }

      final countyId = countyQuery.docs.first.id;

      final spotsSnapshot = await FirebaseFirestore.instance
          .collection('FishingSpots')
          .where('countyId', isEqualTo: countyId)
          .get();

      final Map<String, int> waterTypeCounts = {};

      for (var doc in spotsSnapshot.docs) {
        final spot = doc.data();
        final waterType = spot['waterType'] as String;

        waterTypeCounts[waterType] = (waterTypeCounts[waterType] ?? 0) + 1;
      }

      countyWaterTypeData[countyName] = waterTypeCounts;
    } catch (e) {
      // Handle errors appropriately
      throw Exception('Nem sikerült betölteni a helyeket a megyék alapján: $e');
    }
  }

  Future<void> _loadCounties() async {
    try {
      final fetchedCounties = await fishingSpotRepository.getAllCounties();
      counties.addAll(fetchedCounties);
    } catch (e) {
      // Handle errors if needed
      TLoaders.errorSnackBar(title: 'Hiba', message: 'Valami hiba történt a megyék lekérése során', duration: 2);
    }
  }

  // Call this method to refresh the counties list
  Future<void> updateCountiesList() async {
    try {
      final fetchedCounties = await fishingSpotRepository.getAllCounties();
      counties.value = fetchedCounties;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Hiba', message: 'Valami hiba történt a megyék frissítése során', duration: 2);
      ;
    }
  }

  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      selectedImages.value = images;
    }
  }

  Future<void> saveFishingSpot() async {
    try {
      TFullScreenLoader.openLoadingDialog('Horgászhely mentése folyamatban...', TImages.loadingAnimation);

      // Check network connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validate
      if (!fishingSpotFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (selectedImages.isEmpty) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(title: 'Hiba', message: 'Válassz ki legalább egy képet', duration: 2);
        return;
      }

      // Fetch county name
      final countyName = await fishingSpotRepository.getCountyNameById(county.text.trim());

      final fishingSpot = FishingSpotModel(
        id: '',
        placeName: placeName.text.trim(),
        waterType: waterType.text.trim(),
        settlementName: settlementName.text.trim(),
        gpsCoordinates: gpsCoordinates.text.trim(),
        numberOfSpots: int.parse(numberOfSpots.text.trim()),
        uploadedBy: userController.user.value.username,
        imageUrls: [],
        countyId: county.text.trim(),
        description: description.text.trim(), // Add description here
        countyName: countyName, // Add county name here
      );

      final spotId = await fishingSpotRepository.createFishingSpot(fishingSpot);
      final imageUrls = await fishingSpotRepository.uploadImages(spotId, selectedImages);
      await fishingSpotRepository.updateFishingSpotImages(spotId, imageUrls);

      // Refresh the counties list
      await instance.updateCountiesList();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Nagyszerű', message: 'Sikeresen feltöltötted a horgászhelyet!', duration: 2);

      await Future.delayed(const Duration(seconds: 2));
      Get.back();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString(), duration: 2);
    }
  }

  Future<List<FishingSpotModel>> getFishingSpotsByCountyAndWaterType(String countyName, String waterType) async {
    try {
      // Megye ID lekérése
      final countyQuery = await FirebaseFirestore.instance
          .collection('Counties')
          .where('name', isEqualTo: countyName)
          .limit(1)
          .get();

      if (countyQuery.docs.isEmpty) {
        throw Exception('Megye nem található');
      }

      final countyId = countyQuery.docs.first.id;

      // Horgászhelyek lekérdezése, szűrés megye és víztípus alapján
      final spotsSnapshot = await FirebaseFirestore.instance
          .collection('FishingSpots')
          .where('countyId', isEqualTo: countyId)
          .where('waterType', isEqualTo: waterType)
          .get();

      return spotsSnapshot.docs.map((doc) => FishingSpotModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw Exception('Hiba a helyek lekérésekor: $e');
    }
  }

  // Dynamically load fishing spots for a specific county
  Future<List<FishingSpotModel>> getFishingSpotsByCounty(String countyName) async {
    try {
      // Megye ID lekérése
      final countyQuery = await FirebaseFirestore.instance
          .collection('Counties')
          .where('name', isEqualTo: countyName)
          .limit(1)
          .get();

      if (countyQuery.docs.isEmpty) {
        throw Exception('Megye nem található');
      }

      final countyId = countyQuery.docs.first.id;

      // Horgászhelyek lekérdezése, megye alapján
      final spotsSnapshot = await FirebaseFirestore.instance
          .collection('FishingSpots')
          .where('countyId', isEqualTo: countyId)
          .get();

      return spotsSnapshot.docs.map((doc) => FishingSpotModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw Exception('Hiba a helyek lekérésekor: $e');
    }
  }

  Future<int> getFishingSpotCountByCounty(String countyName) async {
    try {
      final countyQuery = await FirebaseFirestore.instance
          .collection('Counties')
          .where('name', isEqualTo: countyName)
          .limit(1)
          .get();

      if (countyQuery.docs.isEmpty) {
        throw Exception('Megye nem található');
      }

      final countyId = countyQuery.docs.first.id;

      final spotsSnapshot = await FirebaseFirestore.instance
          .collection('FishingSpots')
          .where('countyId', isEqualTo: countyId)
          .get();

      return spotsSnapshot.docs.length; // Horgászhelyek száma
    } catch (e) {
      throw Exception('Hiba történt a helyek lekérésekor: $e');
    }
  }
}
