import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/components/input_basic/input_basic.dart';

class InputPassword extends ConsumerStatefulWidget {
  EdgeInsetsGeometry margin = const EdgeInsets.only(top: 20.0);
  EdgeInsetsGeometry padding = const EdgeInsets.all(0.0);
  late String labelText;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  late bool obscureText;
  late TextEditingController controller;

  InputPassword({
    Key? key,
    this.margin = const EdgeInsets.only(top: 20.0),
    this.padding = const EdgeInsets.all(0.0),
    required this.labelText,
    this.onChanged,
    this.validator,
    this.obscureText = true,
    required this.controller,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputPasswordState();
}

class _InputPasswordState extends ConsumerState<InputPassword> {
  late EdgeInsetsGeometry _margin;
  EdgeInsetsGeometry? _padding;
  String? _labelText;
  void Function(String)? _onChanged;
  String? Function(String?)? _validator;
  late TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _margin = widget.margin;
    _padding = widget.padding;
    _labelText = widget.labelText;
    _onChanged = widget.onChanged;
    _validator = widget.validator;
    _controller = widget.controller;
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return inputBasic(
      controller: _controller,
      margin: _margin,
      padding: _padding,
      labelText: _labelText,
      onChanged: _onChanged,
      validator: _validator,
      obscureText: _obscureText,
    );
  }
}
