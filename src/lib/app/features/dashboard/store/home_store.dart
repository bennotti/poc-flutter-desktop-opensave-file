import 'dart:convert';
import 'dart:io';

import 'package:mobx/mobx.dart';

import '../../../../domain/dtos/document_json_dto.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  DocumentJsonDto? document = new DocumentJsonDto('from memory', 'from memory');

  @action
  Future<void> openDocumentFromFile(String filePath) async {
    File file = new File(filePath);
    String contentJson = await file.readAsString();
    openDocumentFromJson(contentJson);
  }

  @action
  Future<void> openDocumentFromJson(String contentJson) async {
    document = DocumentJsonDto.fromJson(jsonDecode(contentJson));
  }

  @action
  Future<void> saveDocument(String filePath) async {
    File file = new File(filePath);
    await file.writeAsString(jsonEncode(this.document));
  }

  @action
  Future<void> newDocument() async {
    print('novo');
    document = new DocumentJsonDto('from memory new', 'from memory new ');
    await Future.delayed(Duration(milliseconds: 1000), () => false);
  }
}
