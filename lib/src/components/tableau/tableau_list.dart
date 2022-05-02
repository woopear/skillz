import 'package:flutter/material.dart';
import 'package:skillz/src/components/tableau/tableau_content.dart';
import 'package:skillz/src/components/tableau/tableau_head.dart';

class TableauList extends StatefulWidget {
  List tableauHead;
  List tableauContent;

  TableauList({
    required this.tableauHead,
    required this.tableauContent,
    Key? key,
  }) : super(key: key);

  @override
  State<TableauList> createState() => _TableauListState();
}

class _TableauListState extends State<TableauList> {
  late List _tableauHead;
  late List _tableauContent;

  @override
  void initState() {
    _tableauHead = widget.tableauHead;
    _tableauContent = widget.tableauContent;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableauHead(titleHead: _tableauHead),
        TableauContent(contents: _tableauContent),
      ],
    );
  }
}
