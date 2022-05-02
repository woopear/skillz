import 'package:flutter/material.dart';
import 'package:skillz/src/components/box_virgin/box_virgin.dart';

Widget boxPrimary({
  required Widget child,
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
  EdgeInsetsGeometry? margin = const EdgeInsets.symmetric(horizontal: 20.0),
  double? width,
  required BuildContext context,
}) =>
    boxVirgin(
      child: child,
      margin: margin, 
      padding: padding, 
      width: width,
      context: context,
    );
