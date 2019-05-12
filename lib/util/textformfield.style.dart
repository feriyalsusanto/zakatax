import 'package:flutter/material.dart';

class AppTextFormField extends TextFormField {
  static UnderlineInputBorder enableBorder = UnderlineInputBorder(
      borderSide: BorderSide(width: 1.0, color: Colors.white));

  AppTextFormField(
      {String label,
      TextInputType keyboardType,
      TextEditingController controller,
      FormFieldValidator validator,
      bool enabled})
      : super(
            decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: enableBorder,
                focusedBorder: enableBorder),
            style: TextStyle(color: Colors.white),
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            enabled: enabled);
}
