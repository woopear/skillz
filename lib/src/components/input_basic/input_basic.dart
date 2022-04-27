import 'package:flutter/material.dart';

Widget inputBasic({
  EdgeInsetsGeometry margin = const EdgeInsets.only(top: 20.0),
  EdgeInsetsGeometry? padding,
  int? maxLines = 1,
  String? initialValue,
  required TextEditingController controller,
  String? labelText,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  String? hintText,
  String? errorText,
  Widget? icon,
  Color? iconColor,
  Widget? prefixIcon,
  Color? prefixIconColor,
}) => Container(
      margin: margin,
      padding: padding,
      child: TextFormField(
        style: const TextStyle().copyWith(fontSize: 20.0),
        maxLines: maxLines,
        initialValue: initialValue,
        controller: controller,
        decoration: InputDecoration(
          icon: icon,
          iconColor: iconColor,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );