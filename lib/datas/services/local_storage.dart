import 'package:get_storage/get_storage.dart';

abstract class LocalStorage {
  Future writeData({required key, required data});

  Future readData({required key});

  Future removeData({required key});
}

class LocalStorageImpl implements LocalStorage {
  @override
  Future readData({required key}) async {
    final userData = GetStorage();
    await userData.read(key);
  }

  @override
  Future removeData({required key}) async {
    final userData = GetStorage();
    await userData.remove(key);
  }

  @override
  Future writeData({required key, required data}) async {
    final userData = GetStorage();
    await userData.write(key, data);
  }
}
