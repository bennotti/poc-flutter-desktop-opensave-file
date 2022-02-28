import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../features/dashboard/widget/list_item_new_file_widget.dart';
import '../../features/dashboard/widget/list_item_open_file_widget.dart';
import '../../features/dashboard/widget/list_item_save_file_widget.dart';

class SidebarWidget extends StatelessWidget {
  final void Function(BuildContext context) onNewClick;
  final void Function(BuildContext context, String filePath) onSaveClick;
  final void Function(BuildContext context, String filePath) onOpenClick;

  const SidebarWidget(this.onNewClick, this.onOpenClick, this.onSaveClick,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        child: SafeArea(
            right: false,
            child: Drawer(
              elevation: 0,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Logo'),
                    onTap: () {
                      Modular.to.navigate('/dashboard');
                    },
                  ),
                  ListItemNewFileWidget(onNewClick),
                  ListItemOpenFileWidget(onOpenClick),
                  ListItemSaveFileWidget(onSaveClick),
                ],
              ),
            )));
  }
}
