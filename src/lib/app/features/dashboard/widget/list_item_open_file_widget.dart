import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ListItemOpenFileWidget extends StatelessWidget {
  final void Function(BuildContext context, String filePath) onClick;

  const ListItemOpenFileWidget(this.onClick);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Open'),
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          dialogTitle: 'Please select an file:',
          type: FileType.custom,
          allowedExtensions: ['json'],
        );

        if (result == null) {
          // User canceled the picker
          return;
        }

        String filePath = result.files.single.path ?? '';
        this.onClick(context, filePath);
      },
    );
  }
}
