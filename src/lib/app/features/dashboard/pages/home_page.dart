import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:window_manager/window_manager.dart';

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

class HomePageState extends ModularState<HomePage, HomeStore>
    with WindowListener {
  bool _confirmCloseShowing = false;
  bool _loading = true;
  DocumentJsonDto? _document;
  @override
  void initState() {
    windowManager.addListener(this);
    getDocument();
    hideLoading();
    _init();
    super.initState();
  }

  void _init() async {
    // Add this line to override the default close handler
    await windowManager.setPreventClose(true);
    setState(() {});
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {
    if (_confirmCloseShowing) return;
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      _confirmCloseShowing = true;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Are you sure you want to close this window?'),
            actions: [
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _confirmCloseShowing = false;
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                  exit(0);
                },
              ),
            ],
          );
        },
      );
    }
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
        : DocumentJsonForm(
            this._document, controller.documentJsonFormController);
  }

  Widget _load() {
    return Row(
      children: <Widget>[
        SidebarWidget(_onNewClick, _onOpenClick, _onSaveClick),
        Expanded(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: _loadDocumentForm(),
        ))
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
