import 'package:flutter/material.dart';

Widget btnElevated({
  required BuildContext context,
  required void Function()? onPressed,
  required String text,
  EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 20.0),
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? paddingBtn,
  double? fontSize,
  FontWeight? fontWeight,
  Color? bgColor,
}) =>
    Container(
      margin: margin,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle().copyWith(
          backgroundColor: MaterialStateProperty.all<Color?>(bgColor),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(paddingBtn),
        ),
        child: Text(
          text,
          style: const TextStyle().copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
