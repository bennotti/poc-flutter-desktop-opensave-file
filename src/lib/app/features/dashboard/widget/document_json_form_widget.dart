import 'package:flutter/material.dart';

import '../../../../domain/dtos/document_json_dto.dart';
import '../../../shared/widget/input_field.dart';
import 'controllers/document_json_form_controller.dart';

class DocumentJsonForm extends StatefulWidget {
  final DocumentJsonDto? document;
  final DocumentJsonFormController controller;

  const DocumentJsonForm(this.document, this.controller, {Key? key})
      : super(key: key);
  @override
  DocumentJsonFormState createState() => DocumentJsonFormState();
}

class DocumentJsonFormState extends State<DocumentJsonForm> {
  @override
  void initState() {
    super.initState();

    carregarDados();
  }

  Future carregarDados() async {
    setState(() {
      widget.controller.titleInputFieldController.text =
          widget.document?.title ?? '';
      widget.controller.detailsInputFieldController.text =
          widget.document?.details ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        AppBar(
          title: Text("Open/Save Json File"),
        ),
        const SizedBox(height: 21.0),
        InputField(widget.controller.titleInputFieldController,
            label: "Title", hintText: "Title of document"),
        SizedBox(height: 20.0),
        InputField(widget.controller.detailsInputFieldController,
            label: "Details", hintText: "Details of document"),
        SizedBox(height: 20.0),
      ],
    );
  }
}
