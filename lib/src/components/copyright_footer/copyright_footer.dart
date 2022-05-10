import 'package:flutter/material.dart';

Widget copyrightFooter({
  required String text,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
}) => Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: const TextStyle().copyWith(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
