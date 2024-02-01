import 'package:flutter/material.dart';

class textformfield extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  const textformfield(
      {super.key,
      required this.hintText,
      this.isObscureText,
      this.suffixIcon,
      this.onChanged,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFEDEDED),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF07A66FF),
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFFC2C2C2),
          fontWeight: FontWeight.normal,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: Color(0xFFFDFDFF),
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xFF07A66FF),
      ),
    );
  }
}
