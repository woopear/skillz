import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/utils/config/theme/colors.dart';

class CheckBoxList extends ConsumerStatefulWidget {
  String textcheckbox;
  bool? value;
  double? width;
  Color? activeColor;
  Color? checkColor;
  double? fontSize;
  FontWeight? fontWeight;
  Color? selectedTileColor;
  Color? tileColor;
  TextDirection textDirection;

  CheckBoxList({
    Key? key,
    required this.textcheckbox,
    required this.value,
    this.width,
    this.activeColor,
    this.checkColor,
    this.fontSize = 20.0,
    this.fontWeight,
    this.selectedTileColor,
    this.tileColor,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends ConsumerState<CheckBoxList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        child: Directionality(
          textDirection: widget.textDirection,
          child: CheckboxListTile(
            title: Text(
              widget.textcheckbox,
              style: const TextStyle().copyWith(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
              ),
            ),
            value: widget.value,
            activeColor: widget.activeColor ?? ColorCustom().blueLight,
            checkColor: widget.checkColor,
            selectedTileColor: widget.selectedTileColor,
            tileColor: widget.tileColor,
            onChanged: (value) {
              setState(() {
                widget.value = value;
              });
            },
          ),
        ));
  }
}
