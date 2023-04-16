import 'package:combat_tracker/components/entity/entity.dart';
import 'package:combat_tracker/shared/utils.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Entity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textField(nameController, 'Name'),
          numericField(hpController, 'Hp'),
          numericField(maxHpController, 'Max Hp'),
          numericField(initiativeController, 'Initiative'),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
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
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
