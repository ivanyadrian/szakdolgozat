import 'package:flutter/cupertino.dart';

import '../screens/upload_new_element/model/fishing_spot_model.dart';

class FavouriteManager extends ChangeNotifier {
  final List<FishingSpotModel> _favourites = [];

  List<FishingSpotModel> get favourites => _favourites;

  void toggleFavourite(FishingSpotModel fishingSpot) {
    if (_favourites.contains(fishingSpot)) {
      _favourites.remove(fishingSpot);
    } else {
      _favourites.add(fishingSpot);
    }
    notifyListeners();
  }

  bool isFavourite(FishingSpotModel fishingSpot) {
    return _favourites.contains(fishingSpot);
  }
}
