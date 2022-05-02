import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BtnText extends ConsumerStatefulWidget {
  void Function()? onPressed;
  String text;
  double? fontSize;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry? padding;
  FontWeight? fontWeight;
  Color? color;

  BtnText({
    Key? key,
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.margin = const EdgeInsets.symmetric(vertical: 20.0),
    this.padding,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BtnTextState();
}

class _BtnTextState extends ConsumerState<BtnText> {
  bool underline = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: TextButton(
        onHover: (value) {
          setState(() {
            underline = value;
          });
        },
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: const TextStyle().copyWith(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            decoration: underline ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }
}
