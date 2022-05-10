import 'package:flutter/material.dart';
import 'package:skillz/main.dart';

class Notif {
  String? text;
  bool? error;

  Notif({
    Key? key,
    required this.text,
    required this.error,
  });

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> notification(
      BuildContext context) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          text!,
          style: TextStyle(
            color: error! ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
