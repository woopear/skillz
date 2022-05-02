import 'package:flutter/material.dart';

Widget layoutPageApp({
  Widget? child,
  Color? color,
  EdgeInsetsGeometry margin = const EdgeInsets.all(0),
}) =>
    Container(
      color: color,
      margin: margin,
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 30,
        left: 30,
        right: 30,
      ),
      child: child,
    );
