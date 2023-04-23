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
  var _matchHp = true;

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

  _switchMatchHp(value) {
    if (value == null) return;
    setState(() {
      if (value == false) {
        hpController.text = maxHpController.text;
      }
      _matchHp = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Entity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textField(nameController, 'Name'),
          InputNumber(controller: maxHpController, name: 'Max Hp'),
          Row(
            children: [
              Flexible(
                child: InputNumber(
                  controller: _matchHp ? maxHpController : hpController,
                  name: 'Hp',
                  active: !_matchHp,
                ),
              ),
              Checkbox(value: _matchHp, onChanged: _switchMatchHp),
              const Text('Match max hp'),
            ],
          ),
          InputNumber(controller: initiativeController, name: 'Initiative'),
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
