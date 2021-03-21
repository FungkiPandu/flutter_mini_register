import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum MyTextFieldType { outline, contained }

class MyTextField extends StatefulWidget {
  final Key? formKey;
  final String? hintText;
  final IconData? prefixIcon;
  final Color fillColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool autoValidate;
  final TextInputType? inputType;
  final MyTextFieldType type;
  final bool isPassword;

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
    this.type = MyTextFieldType.outline,
    this.isPassword = false,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscure = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType: widget.inputType,
        textInputAction: TextInputAction.done,
        obscureText: widget.isPassword && _obscure,
        decoration: new InputDecoration(
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          filled: widget.type == MyTextFieldType.contained,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _toggle)
              : null,
        ),
      ),
    );
  }
}
