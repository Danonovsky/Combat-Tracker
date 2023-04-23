import 'package:combat_tracker/shared/utils.dart';
import 'package:flutter/material.dart';

class FlexibleInputNumber extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final bool active;

  const FlexibleInputNumber({
    super.key,
    required this.controller,
    required this.name,
    this.active = true,
  });

  @override
  State<FlexibleInputNumber> createState() => _FlexibleInputNumberState();
}

class _FlexibleInputNumberState extends State<FlexibleInputNumber> {
  TextEditingController get _controller => widget.controller;
  String get _name => widget.name;
  bool get _active => widget.active;

  void _decrease() {
    var value = _controller.text == '' ? 0 : int.parse(_controller.text);
    value--;
    _controller.text = value.toString();
  }

  void _increase() {
    var value = _controller.text == '' ? 0 : int.parse(_controller.text);
    value++;
    _controller.text = value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Flexible(
            child: IconButton(
              onPressed: _active ? _decrease : null,
              icon: const Icon(Icons.remove),
            ),
          ),
          Flexible(
            child: numericField(_controller, _name, _active),
          ),
          Flexible(
            child: IconButton(
              onPressed: _active ? _increase : null,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
