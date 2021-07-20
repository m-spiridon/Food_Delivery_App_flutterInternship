  import 'package:flutter/material.dart';

OutlineInputBorder inputBorder(TextEditingController controller) {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: controller.text.isEmpty ? Colors.grey : Colors.black),
    );
  }