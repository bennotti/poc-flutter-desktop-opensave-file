import 'package:flutter/material.dart';

class ListItemNewFileWidget extends StatelessWidget {
  final void Function(BuildContext context) onClick;

  const ListItemNewFileWidget(this.onClick);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('New'),
      onTap: () {
        this.onClick(context);
      },
    );
  }
}
