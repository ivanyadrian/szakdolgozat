import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'loaders.dart';

/// Az internet kapcsolat kezelése és metódusok biztosítása ami kezeli az internet változását
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// A network manager inicializálása és annak biztosítása, hogy figyelje az internet kapcsolat státuszát
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// A kapcsolati státusz frissítése a változások alapján és felugró üzenet megjelenése ha nincs internet
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'Nincs internet kapcsolat');
    }
  }

  /// Az internet kapcsolat státuszának ellenőrzése
  /// true értéket ad vissza ha van internet, egyébként false
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// a kapcsolat megszüntetése
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}