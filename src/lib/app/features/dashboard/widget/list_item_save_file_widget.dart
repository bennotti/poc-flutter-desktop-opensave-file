import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ListItemSaveFileWidget extends StatelessWidget {
  final void Function(BuildContext context, String filePath) onClick;

  const ListItemSaveFileWidget(this.onClick);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Salve'),
      onTap: () async {
        String? filePath = await FilePicker.platform.saveFile(
          dialogTitle: 'Please select an output file:',
          fileName: 'document.json',
          type: FileType.custom,
          allowedExtensions: ['json'],
        );

        if (filePath == null) {
          // User canceled the picker
          return;
        }

        this.onClick(context, filePath);
      },
    );
  }
}
