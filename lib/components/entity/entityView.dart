import 'package:combat_tracker/components/entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      child: Row(
        children: [
          Text(_entity.name),
        ],
      ),
    );
  }
}
