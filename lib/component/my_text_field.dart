import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final Key? formKey;
  final String? hintText;
  final IconData? prefixIcon;
  final Color fillColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool autoValidate;
  final TextInputType? inputType;

  const MyTextField({
    this.formKey,
    this.hintText,
    this.prefixIcon,
    this.fillColor = Colors.white60,
    this.controller,
    this.validator,
    this.onChanged,
    this.autoValidate = false,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: inputType,
        textInputAction: TextInputAction.done,
        decoration: new InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          fillColor: fillColor,
        ),
      ),
    );
  }
}
