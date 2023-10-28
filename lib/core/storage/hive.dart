import 'package:hive/hive.dart';

enum HiveBoxNames {
  categories,
  tasks,
}

class HiveService {
  void deleteItem(key, String boxName) async {
    final _box = await _openBox(boxName);
    await _box.delete(key);
  }

  Future<List> readAll<T>(String boxName) async {
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
    return box.get(key, defaultValue: defaultValue);
  }

  Future<void> saveItem<T>(T item, String boxName, {key}) async {
    final box = await _openBox(boxName);
    await box.put(key, item);
  }

  Future<void> deleteAll(String boxName) async {
    final box = await _openBox(boxName);
    box.clear();
  }

  Future<Box> _openBox(String boxName) async {
    Box box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box(boxName);
    } else {
      box = await Hive.openBox(boxName);
    }
    return box;
  }
}
