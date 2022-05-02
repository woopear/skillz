import 'package:flutter/material.dart';
import 'package:skillz/src/utils/config/theme/colors.dart';

Widget boxVirgin({
  Widget? child,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  double? width,
  required BuildContext context,
}) {
  /// si mode dark ou pas
  bool idModeDark = Theme.of(context).brightness == Brightness.dark;

  return Container(
    width: width,
    margin: margin,
    padding: padding,
    decoration: BoxDecoration(
      color: idModeDark ? ColorCustom().fondDarkBox : ColorCustom().fondClaireBox,
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    child: child,
  );
}
