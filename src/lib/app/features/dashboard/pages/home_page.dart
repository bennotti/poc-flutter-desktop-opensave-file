import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/dtos/document_json_dto.dart';
import '../../../shared/widget/sidebar_widget.dart';
import '../store/home_store.dart';
import '../widget/document_json_form_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeStore> {
  bool _loading = true;
  DocumentJsonDto? _document;
  @override
  void initState() {
    super.initState();
    getDocument();
    hideLoading();
  }

  setDocument(DocumentJsonDto? document) {
    setState(() {
      _document = document;
    });
  }

  getDocument() {
    setDocument(controller.document);
  }

  showLoading() {
    setState(() {
      _loading = true;
    });
  }

  hideLoading() {
    setState(() {
      _loading = false;
    });
  }

  _onNewClick(BuildContext context) async {
    print('new clicado');
    showLoading();
    await controller.newDocument();
    getDocument();
    hideLoading();
  }

  _onOpenClick(BuildContext context, String filePath) async {
    showLoading();
    await controller.openDocumentFromFile(filePath);
    getDocument();
    hideLoading();
  }

  _onSaveClick(BuildContext context, String filePath) async {
    await controller.saveDocument(filePath);
  }

  Widget _loadDocumentForm() {
    return _loading
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: Container(
            height: MediaQuery.of(context).size.height,
            child: DocumentJsonForm(this._document),
          ));
  }

  Widget _load() {
    return Row(
      children: <Widget>[
        SidebarWidget(_onNewClick, _onOpenClick, _onSaveClick),
        _loadDocumentForm(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _load(),
    );
  }
}
