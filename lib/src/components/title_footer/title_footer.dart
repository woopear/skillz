import 'package:flutter/material.dart';

Widget titleFooter({
  required String text,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
}) =>
    Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: const TextStyle().copyWith(
          fontSize: 26,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
