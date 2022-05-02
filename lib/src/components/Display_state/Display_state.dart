import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models_shared/state/schema/state_schema.dart';

class DisplayState extends ConsumerStatefulWidget {
  AlignmentGeometry alignment;
  StateSchema state;

  DisplayState({
    Key? key,
    this.alignment = Alignment.center,
    required this.state,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DisplayStateState();
}

class _DisplayStateState extends ConsumerState<DisplayState> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// icon
            widget.state.tag == 'en attente'
                ? const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                  )
                : widget.state.tag == 'validé'
                    ? const Icon(
                        Icons.mood,
                        color: Colors.green,
                      )
                    : widget.state.tag == 'bannis'
                        ? const Icon(
                            Icons.do_not_disturb_alt_rounded,
                            color: Colors.red,
                          )
                        : widget.state.tag == 'archivé'
                            ? const Icon(
                                Icons.storage_rounded,
                                color: Colors.blue,
                              )
                            : Container(),
            /// text
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(widget.state.tag, style: const TextStyle().copyWith(fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}
