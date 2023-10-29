import 'package:hive/hive.dart';

enum HiveBoxNames { categories, tasks, users }

class HiveService {
  void deleteItem(key, String boxName) async {
    final _box = await _openBox(boxName);
    await _box.delete(key);
  }

  Future<List> readAll(String boxName) async {
    final _box = await _openBox(boxName);
    final values = _box.values;
    final converted = [];
    return converted..addAll(values);
  }

  Future<T> readItem<T>(
    key,
    String boxName, {
    dynamic defaultValue,
  }) async {
    final box = await _openBox(boxName);
    return await box.get(key, defaultValue: defaultValue);
  }

  Future<void> saveItem<T>(T item, String boxName, {key}) async {
    final box = await _openBox(boxName);
    await box.put(key, item);
  }

  Future<void> deleteAll(String boxName) async {
    final box = await _openBox(boxName);
    box.clear();
  }

  Future<Box<T>> _openBox<T>(String boxName) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
    } else {
      box = await Hive.openBox<T>(boxName);
    }
    return box;
  }
}
