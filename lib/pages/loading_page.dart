import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/components/Waiting_load/Waiting_load.dart';
import 'package:skillz/src/utils/config/theme/colors.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCustom().blueLight,
        body: WaitingLoad(),
      ),
    );
  }
}
