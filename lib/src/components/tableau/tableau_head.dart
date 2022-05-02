import 'package:flutter/material.dart';

class TableauHead extends StatefulWidget {
  List titleHead = [];
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  TableauHead({
    required this.titleHead,
    this.margin = const EdgeInsets.only(top: 30.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 30.0),
    Key? key,
  }) : super(key: key);

  @override
  State<TableauHead> createState() => _TableauHeadState();
}

class _TableauHeadState extends State<TableauHead> {
  late List _titleHead;

  @override
  void initState() {
    _titleHead = widget.titleHead;
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
                    for (var title in _titleHead)
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 0.5,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          child: Text(title),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
