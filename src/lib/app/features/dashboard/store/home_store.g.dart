// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$documentAtom = Atom(name: '_HomeStoreBase.document');

  @override
  DocumentJsonDto? get document {
    _$documentAtom.reportRead();
    return super.document;
  }

  @override
  set document(DocumentJsonDto? value) {
    _$documentAtom.reportWrite(value, super.document, () {
      super.document = value;
    });
  }

  final _$openDocumentFromFileAsyncAction =
      AsyncAction('_HomeStoreBase.openDocumentFromFile');

  @override
  Future<void> openDocumentFromFile(String filePath) {
    return _$openDocumentFromFileAsyncAction
        .run(() => super.openDocumentFromFile(filePath));
  }

  final _$openDocumentFromJsonAsyncAction =
      AsyncAction('_HomeStoreBase.openDocumentFromJson');

  @override
  Future<void> openDocumentFromJson(String contentJson) {
    return _$openDocumentFromJsonAsyncAction
        .run(() => super.openDocumentFromJson(contentJson));
  }

  final _$saveDocumentAsyncAction = AsyncAction('_HomeStoreBase.saveDocument');

  @override
  Future<void> saveDocument(String filePath) {
    return _$saveDocumentAsyncAction.run(() => super.saveDocument(filePath));
  }

  final _$newDocumentAsyncAction = AsyncAction('_HomeStoreBase.newDocument');

  @override
  Future<void> newDocument() {
    return _$newDocumentAsyncAction.run(() => super.newDocument());
  }

  @override
  String toString() {
    return '''
document: ${document}
    ''';
  }
}
