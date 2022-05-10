import 'package:flutter/cupertino.dart';

Widget titleTextFooter({
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
          fontWeight: FontWeight.bold,
          fontSize: 13.0
        ),
      ),
    );
