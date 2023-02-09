import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.suffixIcon,
      this.color = const Color.fromARGB(255, 246, 246, 246),
      required this.obscureText,
      required this.onChanged,
      required this.hintText,
      required this.icon,
      required this.controller,
      required this.validator})
      : super(key: key);
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData icon;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Theme.of(context).hintColor,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: color,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(style: BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(style: BorderStyle.none),
        ),
      ),
    );
  }
}
