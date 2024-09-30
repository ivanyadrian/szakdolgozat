import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  late final GetStorage _storage;

  // Singleton instance
  static TLocalStorage? _instance;

  TLocalStorage._internal();

  // Factory constructor to return the singleton instance
  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();  // Correct assignment of the instance
    return _instance!;
  }

  // Initialize the storage with the provided bucket name
  static Future<void> init(String bucketName) async {
    try {
      print('Initializing GetStorage with bucket name: $bucketName');
      await GetStorage.init(bucketName);
      _instance = TLocalStorage._internal();
      _instance!._storage = GetStorage(bucketName);
      print('GetStorage has been initialized successfully.');
    } catch (e) {
      print('Error during TLocalStorage initialization: $e');
      rethrow;
    }
  }


  // Method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Method to remove data by key
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Method to clear all stored data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
