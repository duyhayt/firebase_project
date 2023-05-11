import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  LocalStorage._internal();

  static final LocalStorage _singleton = LocalStorage._internal();
  static LocalStorage get = _singleton;

  final GetStorage _storage = GetStorage();

  Future write(String key, dynamic value) async {
    await _storage.write(key, jsonEncode(value));
  }

  Future read(String key) async {
    await _storage.read(key);
  }

  // Future remove(String key) async {
  //   await _storage.read(key);
  // }

  Future remove(String key) async {
    await _storage.remove(key);
  }
}
