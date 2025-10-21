import 'package:flutter/material.dart';
import 'package:test2_app/core/constants/my_validator.dart';
import 'package:test2_app/core/widget/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.onSaved,
    this.prefixIcon,
    this.controller,
  });
  final Function(String?)? onSaved;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) => MyValidators.passwordValidator(value),
      controller: widget.controller,
      prefix: widget.prefixIcon,
      hintText: 'Password',
      onSaved: widget.onSaved,
      isObscure: isSecure,
      keyboardType: TextInputType.visiblePassword,
      icon: GestureDetector(
        onTap: () {
          setState(() {
            isSecure = !isSecure;
          });
        },
        child: isSecure
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined),
      ),
    );
  }
}
