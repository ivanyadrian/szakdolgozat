import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  final banners = <String>[].obs;
  final isLoading = true.obs; // Loading state

  HomeController() {
    fetchRandomBanners(); // Call the method to fetch banners when initialized
  }

  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchRandomBanners() async {
    isLoading.value = true; // Loading started
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Banners').get();
      final List<String> allBanners = snapshot.docs.map((doc) => doc['imageUrl'] as String).toList();

      // Shuffle the images and take three random ones
      allBanners.shuffle();
      banners.value = allBanners.take(3).toList();
    } catch (e) {
      print('Error fetching banners: $e');
      // Optionally handle the error (e.g., show a message)
    } finally {
      isLoading.value = false; // Loading finished
    }
  }
}
