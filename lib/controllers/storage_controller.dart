import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  final _storage = const FlutterSecureStorage();
  addUnverified() async {
    //   await _storage.write(key: 'email', value: email);
    //   await _storage.write(key: 'pass', value: pass);
    await _storage.write(key: 'verified', value: 'false');
    print("Added to sttorage");
  }

  addToken(String token) async {
    print(token);
    await _storage.write(key: 'token', value: token);
  }

  addVerified() async {
    await _storage.write(key: 'verified', value: 'true');
  }

  Future<Map<String, String>> getDetails() async {
    print("Getting details");
    return await _storage.readAll();
  }

  deleteDetails() async {
    await _storage.deleteAll();
    print("Deleted from storage");
  }
}
