import 'dart:convert';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/data/repositories/fishing_spots/fishing_spot_repository.dart';
import 'package:szakdolgozat_app/features/browsing/screens/upload_new_element/model/fishing_spot_model.dart';
import 'package:szakdolgozat_app/utils/local_storage/storage_utility.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  /// Variables
  final favourites = <String, bool>{}.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print('Initializing favourites...');

    // Várakozás, hogy biztosan inicializálva legyen a storage (statikus init hívás)
    await TLocalStorage.init('favourites');

    // Kedvencek inicializálása
    await initFavourites();
  }

  // Method to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    try {
      final json = TLocalStorage.instance().readData('favourites');
      print('Kedvencek beolvasása: $json');

      if (json != null) {
        final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
        favourites.assignAll(
            storedFavourites.map((key, value) => MapEntry(key, value as bool))
        );
      } else {
        print('Nincs mentve adat');
      }
    } catch (e) {
      print('Hiba történt a kedvencek inicializálása során: $e');
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      // Add to favourites
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: 'Hozzáadva a kedvencekhez');
    } else {
      // Remove from favourites
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Eltávolítva a kedvencek közül');
    }
  }

  void saveFavouritesToStorage() {
    try {
      final encodedFavourites = json.encode(favourites);
      TLocalStorage.instance().saveData('favourites', encodedFavourites);
    } catch (e) {
      print('Hiba történt a kedvencek mentésekor: $e');
    }
  }

  Future<List<FishingSpotModel>> favouriteProducts() async {
    if (favourites.isEmpty) {
      return [];
    }
    try {
      return await FishingSpotRepository.instance
          .getFavouriteProducts(favourites.keys.toList());
    } catch (e) {
      print('Váratlan hiba történt a kedvencek lekérésekor: $e');
      return [];
    }
  }
}
