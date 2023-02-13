import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final String hint;
  final String label;

  //Construter
  const TextFieldWidget({
    required this.controller,
    required this.keyboardType,
    required this.readOnly,
    required this.hint,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        validator: (String? inputText) {
          if (inputText!.trim().toString().isEmpty) {
            return "Please fill the input field.";
          }
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
