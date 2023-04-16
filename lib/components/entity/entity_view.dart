import 'package:combat_tracker/components/entity/entity.dart';
import 'package:flutter/material.dart';

class EntityView extends StatefulWidget {
  const EntityView({super.key, required this.entity});
  final Entity entity;

  @override
  State<EntityView> createState() => _EntityViewState();
}

class _EntityViewState extends State<EntityView> {
  late final Entity _entity = widget.entity;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_entity.name),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                      child: LinearProgressIndicator(
                        value: _entity.displayHp,
                        color: _entity.color,
                        minHeight: 20,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_entity.displayStatus),
                    ),
                  ),
                ],
              ),
            ),
            Text(_entity.initiative.toString()),
          ],
        ),
      ),
    );
  }
}
