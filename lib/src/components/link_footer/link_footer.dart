import 'package:flutter/material.dart';
import 'package:skillz/src/components/Btn_text/Btn_text.dart';

Widget linkFooter({
  required void Function()? onPressed,
  required String text,
  EdgeInsetsGeometry? margin = const EdgeInsets.only(top: 10.0),
  EdgeInsetsGeometry? padding,
}) =>
    Container(
      margin: margin,
      padding: padding,
      child: BtnText(
        color: Colors.grey,
        fontSize: 13.0,
        onPressed: onPressed,
        text: text,
      ),
    );
