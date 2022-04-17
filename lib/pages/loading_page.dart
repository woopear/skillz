import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/utils/config/theme/colors.dart';
import 'package:skillz/widgets_shared/index.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCustom().blueLight,
        body: const WaitingLoad(),
      ),
    );
  }
}
