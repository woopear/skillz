import 'package:flutter/material.dart';
import 'package:skillz/src/components/display_avatar_circle/display_avatar_circle.dart';

Widget boxBrandApp({
  String? brand,
  String? image,
  double size = 26,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
  required BuildContext context,
}) =>
    Container(
      margin: margin,
      padding: padding,
      child: Row(
        children: [
          /// image
          image != null
              ? displayAvatartCircle(
                  context: context,
                  image: image,
                  size: size,
                )
              : Icon(Icons.delivery_dining_sharp, size: size),

          /// brand
          brand != null
              ? Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    brand,
                    style: const TextStyle().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
