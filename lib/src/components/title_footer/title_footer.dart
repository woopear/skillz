import 'package:flutter/material.dart';

Widget titleFooter({
  required String text,
}) =>
    Container(
      child: Text(
        text,
        style: const TextStyle().copyWith(
          fontSize: 26,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
