import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart'; // Ensure you have the correct import for loaders
import 'package:szakdolgozat_app/common/widgets/loaders/network_manager.dart';
import '../../../../utils/constans/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import 'empty_repository.dart';

class UploadImageController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final UploadImageRepository _repository = UploadImageRepository();

  var selectedImages = <File>[].obs;

  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      selectedImages.clear();
      for (var image in images) {
        selectedImages.add(File(image.path));
      }
    }
  }

  Future<void> uploadImages() async {
    if (selectedImages.isEmpty) {
      TLoaders.warningSnackBar(title: 'Hiba', message: 'Válassz ki legalább egy képet', duration: 2);
      return;
    }

    // Open loading dialog
    TFullScreenLoader.openLoadingDialog('Feltöltése folyamatban...', TImages.loadingAnimation);

    try {
      // Check network connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Hiba', message: 'Nincs internet kapcsolat!', duration: 2);
        return;
      }

      for (var image in selectedImages) {
        await _repository.uploadImage(image);
      }
      TLoaders.successSnackBar(title: 'Nagyszerű', message: 'Képek sikeresen feltöltve!', duration: 2);
      selectedImages.clear();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Hiba', message: 'Hiba történt a képek feltöltése során: $e', duration: 2);
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
