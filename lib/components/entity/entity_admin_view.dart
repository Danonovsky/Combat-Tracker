import 'dart:html';

import 'package:combat_tracker/components/entity/entity.dart';
import 'package:combat_tracker/shared/widgets/flexible_input_number.dart';
import 'package:flutter/material.dart';

class EntityAdminView extends StatefulWidget {
  const EntityAdminView({super.key, required this.entity});
  final Entity entity;

  @override
  State<EntityAdminView> createState() => _EntityAdminViewState();
}

class _EntityAdminViewState extends State<EntityAdminView> {
  late final Entity _entity = widget.entity;
  late final TextEditingController _hpController = TextEditingController();
  late final TextEditingController _maxHpController = TextEditingController();
  late final TextEditingController _initiativeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _hpController.text = _entity.hp.toString();
    _maxHpController.text = _entity.maxHp.toString();
    _initiativeController.text = _entity.initiative.toString();

    _hpController.addListener(_updateHp);
    _maxHpController.addListener(_updateMaxHp);
    _initiativeController.addListener(_updateInitiative);
  }

  _updateHp() {
    setState(() {
      _entity.hp = int.parse(_hpController.text == '' ? '0' : _hpController.text);
    });
  }

  _updateMaxHp() {
    setState(() {
      _entity.maxHp = int.parse(_maxHpController.text == '' ? '0' : _maxHpController.text);
    });
  }

  _updateInitiative() {
    setState(() {
      _entity.initiative = int.parse(_initiativeController.text == '' ? '0' : _initiativeController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              _entity.name,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                          child: LinearProgressIndicator(
                            value: _entity.hp / _entity.maxHp,
                            color: _entity.color,
                            minHeight: 20,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${_entity.hp}/${_entity.maxHp}'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                FlexibleInputNumber(controller: _hpController, name: 'Hp'),
                FlexibleInputNumber(controller: _maxHpController, name: 'Max Hp'),
                FlexibleInputNumber(controller: _initiativeController, name: 'Initiative'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
