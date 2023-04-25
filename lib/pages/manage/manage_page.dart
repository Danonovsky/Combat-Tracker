import 'package:combat_tracker/components/entity/entity.dart';
import 'package:combat_tracker/components/entity/entity_admin_view.dart';
import 'package:combat_tracker/pages/manage/add_entity_dialog.dart';
import 'package:combat_tracker/shared/appbar.dart';
import 'package:flutter/material.dart';

class ManagePage extends StatefulWidget {
  static const String route = '/manage';
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final List<Entity> _entities = [
    Entity(),
    Entity(),
    Entity(),
  ];

  addEntity() async {
    var entity = await showDialog<Entity>(
      context: context,
      builder: (context) => const AddEntityDialog(),
    );
    if (entity == null) return;
    setState(() {
      _entities.add(entity);
    });
  }

  _reorder(oldIndex, newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = _entities.removeAt(oldIndex);
      _entities.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Combat Tracker - Manage'),
      body: Center(
        child: ReorderableListView(
          onReorder: _reorder,
          children: _entities
              .map((e) => EntityAdminView(
                    key: ValueKey(e),
                    entity: e,
                  ))
              .toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: addEntity,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
