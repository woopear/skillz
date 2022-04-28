import 'package:flutter/material.dart';
import 'package:skillz/src/components/index.dart';

Widget linkFooter({
  required void Function()? onPressed,
  required String text,
}) =>
    Container(
      child: BtnText(
        onPressed: onPressed,
        text: text,
      ),
    );
