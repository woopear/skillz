import 'package:flutter/material.dart';
import 'package:skillz/src/components/btn_close/btn_close.dart';
import 'package:skillz/src/components/btn_delete/btn_delete.dart';
import 'package:skillz/src/components/btn_save/btn_save.dart';
import 'package:skillz/src/components/btn_update/btn_update.dart';

class TableauRowBtnUpdateDelete extends StatefulWidget {
  void Function()? onPressedDelete;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  double iconSize;

  TableauRowBtnUpdateDelete({
    required this.onPressedDelete,
    this.margin,
    this.padding,
    this.iconSize = 20,
    Key? key,
  }) : super(key: key);

  @override
  State<TableauRowBtnUpdateDelete> createState() =>
      _TableauRowBtnUpdateDeleteState();
}

class _TableauRowBtnUpdateDeleteState extends State<TableauRowBtnUpdateDelete> {
  void Function()? _onPressedDelete;
  late EdgeInsetsGeometry? _margin;
  late EdgeInsetsGeometry? _padding;
  late double _iconSize;
  late bool seeUpdate = true;

  openCloseSeeUpdate() {
    setState(() {
      seeUpdate = !seeUpdate;
    });
  }

  @override
  void initState() {
    _onPressedDelete = widget.onPressedDelete;
    _margin = widget.margin;
    _padding = widget.padding;
    _iconSize = widget.iconSize;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        seeUpdate
            ? btnUpdateEntite(
                margin: _margin,
                padding: _padding,
                onPressed: openCloseSeeUpdate,
                iconSize: _iconSize,
              )
            : btnSave(
              margin: _margin,
                padding: _padding,
                onPressed: (() => {}),
                iconSize: _iconSize,
              ),
        seeUpdate
            ? btnDelete(
                margin: _margin,
                padding: _padding,
                onPressed: _onPressedDelete,
                iconSize: _iconSize,
              )
            : btnClose(
                margin: _margin,
                padding: _padding,
                onPressed: openCloseSeeUpdate,
                iconSize: _iconSize,
              ),
      ],
    );
  }
}
