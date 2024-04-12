import 'package:flutter/material.dart';

@override
Widget buildTextField(
    BuildContext context,
    String labelText,
    TextEditingController controller,
    String hintText,
    //Function(String?)? validator
    ) {

  return TextFormField(
      //validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ));
}