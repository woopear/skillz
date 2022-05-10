import 'package:flutter/material.dart';

Widget layoutContentChildApp({
    required Widget child,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 70.0,
      horizontal: 30.0,
    ),
    child: child,
  );
}