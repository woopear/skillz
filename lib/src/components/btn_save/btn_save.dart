import 'package:flutter/material.dart';

Widget btnSave({
  required void Function()? onPressed,
    String? message,
  EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 20.0),
  AlignmentGeometry alignment = Alignment.center,
  EdgeInsetsGeometry? padding,
  double iconSize = 30,
}) => Align(
      alignment: alignment,
      child: Container(
        margin: margin,
        padding: padding,
        child: message != null 
        ? Tooltip(
          message: message,
          child: IconButton(
            iconSize: iconSize,
            onPressed: onPressed,
            icon: const Icon(
              Icons.save,
              color: Colors.green,
            ),
          ),
        )
        : IconButton(
            iconSize: iconSize,
            onPressed: onPressed,
            icon: const Icon(
              Icons.save,
              color: Colors.green,
            ),
          ),
      ),
    );