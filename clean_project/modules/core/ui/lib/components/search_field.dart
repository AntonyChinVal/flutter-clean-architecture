import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;

  const SearchField({Key? key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFFBEC2CE),
        ),
        hintText: "Search",
        hintStyle: const TextStyle(color: Color(0xFFBEC2CE)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFEAECEF), width: 1.0),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFEAECEF), width: 1.0),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
