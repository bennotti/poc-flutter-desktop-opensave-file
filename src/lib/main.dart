import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:window_manager/window_manager.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();

    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setSize(Size(800, 600));
      await windowManager.setMaximumSize(Size(800, 600));
      await windowManager.setMinimumSize(Size(800, 600));
      await windowManager.setMinimizable(false);
      await windowManager.setResizable(false);
      await windowManager.setFullScreen(false);
    });
  }
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
