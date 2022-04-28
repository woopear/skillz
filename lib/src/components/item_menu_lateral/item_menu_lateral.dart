import 'package:flutter/material.dart';

Widget ItemMenu({
  required String text,
  required IconData icon,
  Color? colorIcon,
  Color? colorText,
  void Function()? onTap,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: colorIcon,
    ),
    title: Text(
      text,
      style: TextStyle(fontSize: 18.0, color: colorText),
    ),
    hoverColor: Colors.white10,
    onTap: onTap,
  );
}
