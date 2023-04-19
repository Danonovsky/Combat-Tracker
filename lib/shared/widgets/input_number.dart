import 'package:combat_tracker/shared/utils.dart';
import 'package:flutter/material.dart';

class InputNumber extends StatefulWidget {
  final TextEditingController controller;
  final String name;

  const InputNumber({
    super.key,
    required this.controller,
    required this.name,
  });

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  TextEditingController get _controller => widget.controller;
  String get _name => widget.name;

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
    return Row(children: [
      Flexible(child: IconButton(onPressed: _decrease, icon: const Icon(Icons.remove))),
      Flexible(child: numericField(_controller, _name)),
      Flexible(child: IconButton(onPressed: _increase, icon: const Icon(Icons.add))),
    ]);
  }
}
