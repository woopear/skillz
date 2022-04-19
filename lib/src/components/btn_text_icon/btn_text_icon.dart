import 'package:flutter/material.dart';

Widget btnTextIcon({
  required void Function()? onPressed,
  required Widget icon,
  required String text,
  EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 20.0),
  EdgeInsetsGeometry? padding,
}) =>
    Container(
      margin: margin,
      padding: padding,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: Text(text, style: const TextStyle(decoration: TextDecoration.underline),),
        ),
      ),
    );
