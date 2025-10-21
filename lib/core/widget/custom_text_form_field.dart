import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.hintText,
    super.key,
    this.keyboardType,
    this.onPressed,
    this.isObscure,
    this.icon,
    this.onSaved,
    this.prefix,
    this.controller,
    this.validator,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final void Function()? onPressed;
  final bool? isObscure;
  final Widget? icon, prefix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },

      obscureText: isObscure ?? false,
      keyboardType: keyboardType,
      onSaved: onSaved,
      decoration: InputDecoration(
        prefix: prefix,
        hintFadeDuration: const Duration(seconds: 1),
        isDense: true,
        contentPadding: const EdgeInsets.all(16),
        border: outlineInputBorder(const Color(0xFFD9D9D9)),
        enabledBorder: outlineInputBorder(const Color(0xFFD9D9D9)),
        focusedBorder: outlineInputBorder(const Color(0xFF49A9E1)),
        suffixIcon: icon,
        suffixIconColor: const Color(0xFFBDBDBD),
        hintText: hintText,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: color),
    );
  }
}
