import 'package:combat_tracker/components/entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddEntityDialog extends StatefulWidget {
  const AddEntityDialog({super.key});

  @override
  State<AddEntityDialog> createState() => _AddEntityDialogState();
}

class _AddEntityDialogState extends State<AddEntityDialog> {
  final nameController = TextEditingController();
  final hpController = TextEditingController();
  final maxHpController = TextEditingController();
  final initiativeController = TextEditingController();

  TextField _textField(TextEditingController controller, String label) {
    return TextField(
      decoration: _decoration(label),
      controller: controller,
    );
  }

  TextField _numericField(TextEditingController controller, String label) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: _decoration(label),
      controller: controller,
    );
  }

  InputDecoration _decoration(String label) => InputDecoration(labelText: label);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Entity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _textField(nameController, 'Name'),
          _numericField(hpController, 'Hp'),
          _numericField(maxHpController, 'Max Hp'),
          _numericField(initiativeController, 'Initiative'),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            var entity = Entity.from(
              name: nameController.text,
              hp: int.parse(hpController.text),
              maxHp: int.parse(maxHpController.text),
              initiative: int.parse(initiativeController.text),
            );
            Navigator.pop(context, entity);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
