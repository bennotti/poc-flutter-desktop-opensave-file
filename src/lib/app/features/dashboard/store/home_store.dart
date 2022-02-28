import 'dart:convert';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/contract/infraestructure/localstorage/ILocalStorage.dart';
import '../../../../domain/dtos/document_json_dto.dart';
import '../../../../domain/dtos/recents_documents_dto.dart';
import '../widget/controllers/document_json_form_controller.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final storage = Modular.get<ILocalStorage>();
  @observable
  DocumentJsonDto? document = new DocumentJsonDto();
  @observable
  DocumentJsonFormController documentJsonFormController =
      new DocumentJsonFormController();

  @action
  Future<RecentsDocumentsDto> recentFiles() async {
    String? contentJson = await storage.get('recent-files');
    if (contentJson == null) return new RecentsDocumentsDto();
    RecentsDocumentsDto recents =
        RecentsDocumentsDto.fromJson(jsonDecode(contentJson));
    print('abriu');
    print(contentJson);
    return recents;
  }

  @action
  Future<RecentsDocumentsDto> saveRecentFiles(String filePath) async {
    var recents = await recentFiles();

    if (recents.files.contains(filePath)) {
      return recents;
    }

    recents.files.add(filePath);
    print('salvou');
    await storage.put('recent-files', jsonEncode(recents));
    return recents;
  }

  @action
  Future<void> openDocumentFromFile(String filePath) async {
    File file = new File(filePath);
    String contentJson = await file.readAsString();
    await openDocumentFromJson(contentJson);
    await saveRecentFiles(filePath);
  }

  @action
  Future<void> openDocumentFromJson(String contentJson) async {
    document = DocumentJsonDto.fromJson(jsonDecode(contentJson));
  }

  @action
  Future<void> saveDocument(String filePath) async {
    document?.title = documentJsonFormController.titleInputFieldController.text;
    document?.details =
        documentJsonFormController.detailsInputFieldController.text;
    File file = new File(filePath);
    await file.writeAsString(jsonEncode(this.document));
    await saveRecentFiles(filePath);
  }

  @action
  Future<void> newDocument() async {
    document = new DocumentJsonDto();
    await Future.delayed(Duration(milliseconds: 10), () => false);
  }
}
