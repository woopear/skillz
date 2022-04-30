import 'package:flutter/material.dart';
import 'package:skillz/src/components/display_avatar_circle/display_avatar_circle.dart';

Widget displayAvatartCircleName({
  String? image,
  double size = 150,
  required String userName,
  EdgeInsetsGeometry? margin,
  required BuildContext context,
  required double widthResponsive,
}) =>
    Container(
      margin: margin,
      child: Column(
        children: [
          /// avatar
          displayAvatartCircle(context: context, image: image, size: size),

          /// name
          Container(
            child: Text(
              userName,
              style: const TextStyle().copyWith(
                fontSize: widthResponsive > 700 ? 20.0 : 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
