import 'package:combat_tracker/components/entity/entity.dart';
import 'package:combat_tracker/shared/widgets/flexible_input_number.dart';
import 'package:combat_tracker/shared/widgets/input_number.dart';
import 'package:flutter/material.dart';

class EntityAdminView extends StatefulWidget {
  const EntityAdminView({super.key, required this.entity});
  final Entity entity;

  @override
  State<EntityAdminView> createState() => _EntityAdminViewState();
}

class _EntityAdminViewState extends State<EntityAdminView> {
  late final Entity _entity = widget.entity;
  late final TextEditingController _hpController = TextEditingController(
    text: _entity.hp.toString(),
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_entity.name),
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
                Text('${_entity.initiative}'),
              ],
            ),
            Row(
              children: [
                FlexibleInputNumber(controller: _hpController, name: 'Hp'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
