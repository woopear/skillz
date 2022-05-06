import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/utils/config/theme/colors.dart';

class TitlePageApp extends ConsumerStatefulWidget {
  String text;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  TitlePageApp({
    Key? key,
    required this.text,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TitlePageAppState();
}

class _TitlePageAppState extends ConsumerState<TitlePageApp> {
  final double _sizeSup700 = 36;
  final double _sizeSup500 = 30;
  final double _size = 26;

  @override
  Widget build(BuildContext context) {
    /// on recupere la largeur
    final _width = MediaQuery.of(context).size.width;

    final sup700 = _width > 700;
    final sup500 = _width > 500;

    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: Text(
        widget.text,
        style: const TextStyle().copyWith(
          color: ColorCustom().blueLight,
          fontSize: sup700
              ? _sizeSup700
              : sup500
                  ? _sizeSup500
                  : _size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}