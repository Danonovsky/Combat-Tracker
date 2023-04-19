import 'package:combat_tracker/components/entity/entity.dart';
import 'package:combat_tracker/shared/utils.dart';
import 'package:combat_tracker/shared/widgets/input_number.dart';
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

  _add() {
    if (nameController.text == '' ||
        hpController.text == '' ||
        maxHpController.text == '' ||
        initiativeController.text == '') return;
    var entity = Entity.from(
      name: nameController.text,
      hp: int.parse(hpController.text),
      maxHp: int.parse(maxHpController.text),
      initiative: int.parse(initiativeController.text),
    );
    Navigator.pop(context, entity);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Entity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textField(nameController, 'Name'),
          InputNumber(controller: hpController, name: 'Hp'),
          InputNumber(controller: maxHpController, name: 'Max Hp'),
          numericField(initiativeController, 'Initiative'),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: _add,
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
