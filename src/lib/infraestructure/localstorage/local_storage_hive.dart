import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/contract/infraestructure/localstorage/ILocalStorage.dart';

class LocalStorageHive implements ILocalStorage {
  Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  LocalStorageHive() {
    _init();
  }

  @override
  Future delete(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<dynamic> get(String key) async {
    var box = await _instance.future;
    return box.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    var box = await _instance.future;
    box.put(key, value);
  }
}
