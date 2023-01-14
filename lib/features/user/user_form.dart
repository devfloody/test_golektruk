import 'package:flutter/material.dart';

import '../../utils/fonts/app_font.dart';

class UserForm extends StatelessWidget {
  const UserForm({
    Key? key,
    required this.controller,
    this.keyboardType,
    required this.placeholder,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String placeholder;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: AppFont.poppinsRegular.copyWith(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.deepPurple,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade900,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
