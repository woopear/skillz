import 'package:flutter/material.dart';

Widget BtnText({
  required void Function()? onPressed,
  required String text,
  double? fontSize,
  EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 20.0),
  EdgeInsetsGeometry? padding,
  FontWeight? fontWeight,
}) =>
    Container(
      margin: margin,
      padding: padding,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle().copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
