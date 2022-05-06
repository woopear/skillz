import 'package:flutter/material.dart';
import 'package:skillz/src/components/btn_delete/btn_delete.dart';
import 'package:skillz/src/components/btn_update_entitie/btn_update_entite.dart';

Widget arrayBtnActionUpdateDelete({
  double iconSize = 20,
  EdgeInsetsGeometry marginUpdate = const EdgeInsets.all(0.0),
  EdgeInsetsGeometry marginDelete = const EdgeInsets.all(0.0),
  required void Function()? onPressedUpdate,
  required void Function()? onPressedDelete,
}) =>
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          btnUpdateEntite(
            message: 'Modifier',
            margin: marginUpdate,
            onPressed: onPressedUpdate,
            iconSize: iconSize,
          ),
          btnDelete(
            message: 'Supprimer',
            margin: marginDelete,
            onPressed: onPressedDelete,
            iconSize: iconSize,
          )
        ],
      ),
    );
