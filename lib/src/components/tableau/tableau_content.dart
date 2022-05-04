import 'package:flutter/material.dart';
import 'package:skillz/src/components/tableau/tableau_row_btn_update_delete.dart';

class TableauContent extends StatefulWidget {
  List contents = [];
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  TableauContent({
    required this.contents,
    this.margin = const EdgeInsets.only(top: 30.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 30.0),
    Key? key,
  }) : super(key: key);

  @override
  State<TableauContent> createState() => _TableauHeadState();
}

class _TableauHeadState extends State<TableauContent> {
  late List _contents;

  @override
  void initState() {
    _contents = widget.contents;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                margin: widget.margin,
                padding: widget.padding,
                child: Row(
                  children: [
                    /// boucle sur le content du table
                    for (var content in _contents)
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(content),
                        ),
                      ),
                    TableauRowBtnUpdateDelete(onPressedDelete: () => {},),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
