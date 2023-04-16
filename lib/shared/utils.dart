import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField textField(TextEditingController controller, String label) {
  return TextField(
    decoration: decoration(label),
    controller: controller,
  );
}

TextField numericField(TextEditingController controller, String label) {
  return TextField(
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: decoration(label),
    controller: controller,
  );
}

InputDecoration decoration(String label) => InputDecoration(labelText: label);
