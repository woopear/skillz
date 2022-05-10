import 'package:flutter/material.dart';

Widget layoutSectionCommerce({
  Widget? child,
  Color? color,
  EdgeInsetsGeometry margin = const EdgeInsets.all(0),
}) =>
    Container(
      color: color,
      margin: margin,
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 40,
        left: 30,
        right: 30,
      ),
      child: child,
    );
