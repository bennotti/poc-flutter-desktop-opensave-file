import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  InputField(this.controller, {required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.label),
            CustomTextField(
                obscureText: false,
                controller: this.controller,
                keyboardType: TextInputType.text,
                hintText: this.hintText),
          ],
        );
      },
    );
  }
}
