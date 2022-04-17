import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skillz/utils/config/theme/colors.dart';

class WaitingLoad extends ConsumerWidget {
  const WaitingLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SpinKitCircle(
        color: ColorCustom().orange,
        size: 100,
      ),
    );
  }
}
