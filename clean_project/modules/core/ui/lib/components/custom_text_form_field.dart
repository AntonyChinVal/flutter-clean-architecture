import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CustomTextFormField({Key? key, this.label = 'Label', this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFFBEC2CE), fontSize: 16),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEFEFEF))),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCCCCCC))),
      ),
    );
  }
}
