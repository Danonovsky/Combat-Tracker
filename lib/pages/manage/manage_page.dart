import 'package:combat_tracker/components/entity/entity.dart';
import 'package:combat_tracker/components/entity/entity_view.dart';
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
  final List<Entity> _entities = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Combat Tracker - Manage'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _entities.map((e) => EntityView(entity: e)).toList(),
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
