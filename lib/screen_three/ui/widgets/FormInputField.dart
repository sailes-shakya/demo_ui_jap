import 'package:flutter/material.dart';
import 'package:task_demo_ui/utils/three_styles.dart';

class FormInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final InputDecoration decoration;

  FormInputField({
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kFormPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: kFormLabelStyle),
          SizedBox(height: 8.0),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: decoration,
          ),
        ],
      ),
    );
  }
}
