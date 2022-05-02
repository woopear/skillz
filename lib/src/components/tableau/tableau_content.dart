import 'package:flutter/material.dart';

class TableauContent extends StatefulWidget {
  List contents = [];
  TableauContent({
    required this.contents,
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
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    for (var content in _contents)
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(content),
                        ),
                      ),
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
