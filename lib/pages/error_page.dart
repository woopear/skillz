import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/components/Waiting_error/Waiting_error.dart';

class ErrorPage extends ConsumerWidget {
  String messageError;
  ErrorPage({Key? key, required this.messageError}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body:  WaitingError(messageError: messageError),
      ),
    );
  }
}
