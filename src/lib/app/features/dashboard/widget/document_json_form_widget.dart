import 'package:flutter/material.dart';

import '../../../../domain/dtos/document_json_dto.dart';
import '../../../shared/widget/input_field.dart';

class DocumentJsonForm extends StatefulWidget {
  final DocumentJsonDto? document;

  const DocumentJsonForm(this.document, {Key? key}) : super(key: key);
  @override
  DocumentJsonFormState createState() => DocumentJsonFormState();
}

class DocumentJsonFormState extends State<DocumentJsonForm> {
  final titleInputFieldController = TextEditingController();
  final detailsInputFieldController = TextEditingController();
  @override
  void initState() {
    super.initState();

    carregarDados();
  }

  Future carregarDados() async {
    setState(() {
      titleInputFieldController.text = widget.document?.title ?? "qwe";
      detailsInputFieldController.text = widget.document?.details ?? "qwe1";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(),
      children: [
        Text(
          "Open/Save Json File",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 35.0,
              fontFamily: 'Merriweather'),
        ),
        const SizedBox(height: 21.0),
        InputField(titleInputFieldController,
            label: "Title", hintText: "Title of document"),
        SizedBox(height: 20.0),
        InputField(detailsInputFieldController,
            label: "Details", hintText: "Details of document"),
        SizedBox(height: 20.0),
      ],
    );
  }
}
