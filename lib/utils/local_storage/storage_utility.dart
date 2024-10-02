import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  late final GetStorage _storage;
  String _bucketName = ''; // Store the bucket name

  // Singleton instance
  static TLocalStorage? _instance;

  TLocalStorage._internal();

  // Factory constructor to return the singleton instance
  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  /// Initialize the storage with the provided bucket name
  static Future<void> init(String bucketName) async {
    if (_instance == null) {
      _instance = TLocalStorage._internal();
      try {
        print('Initializing GetStorage with bucket name: $bucketName');
        await GetStorage.init(bucketName);
        _instance!._storage = GetStorage(bucketName);
        _instance!._bucketName = bucketName; // Store the bucket name
        print('GetStorage has been initialized successfully.');
      } catch (e) {
        print('Error during TLocalStorage initialization: $e');
        rethrow; // Consider logging or handling the error appropriately
      }
    } else {
      print('GetStorage is already initialized with bucket name: ${_instance!._bucketName}');
    }
  }

  /// Save data to local storage
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
    print('Saved data: $key = $value');
  }

  /// Read data from local storage
  T? readData<T>(String key) {
    final value = _storage.read<T>(key);
    print('Read data: $key = $value');
    return value;
  }

  /// Remove data from local storage by key
  Future<void> removeData(String key) async {
    await _storage.remove(key);
    print('Removed data: $key');
  }

  /// Clear all stored data
  Future<void> clearAll() async {
    await _storage.erase();
    print('All data cleared from storage.');
  }
}

