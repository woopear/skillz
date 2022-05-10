import 'package:flutter/material.dart';

Widget subTitleFooter({
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
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
