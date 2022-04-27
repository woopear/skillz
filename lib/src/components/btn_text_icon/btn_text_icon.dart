import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BtnTextIcon extends ConsumerStatefulWidget {
  void Function()? onPressed;
  Widget? icon;
  String text;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry? padding;

  BtnTextIcon({
    Key? key,
    required this.onPressed,
    this.icon,
    required this.text,
    this.margin = const EdgeInsets.symmetric(vertical: 20.0),
    this.padding,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BtnTextIconState();
}

class _BtnTextIconState extends ConsumerState<BtnTextIcon> {
  bool underline = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          onHover: (value) {
            setState(() {
              underline = value;
            });
          },
          onPressed: widget.onPressed,
          icon: Directionality(
              child: widget.icon ??
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                  ),
              textDirection: TextDirection.rtl),
          label: Text(
            widget.text,
            style: TextStyle(
              decoration: underline ? TextDecoration.underline : null,
            ),
          ),
        ),
      ),
    );
  }
}
