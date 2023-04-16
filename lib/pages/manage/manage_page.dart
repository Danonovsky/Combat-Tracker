import 'package:combat_tracker/components/entity/entity.dart';
import 'package:combat_tracker/components/entity/entity_view.dart';
import 'package:flutter/material.dart';
import '../../shared/appbar.dart';

class ManagePage extends StatefulWidget {
  static const String route = '/manage';
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final List<Entity> _entities = [
    Entity(),
  ];

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
        onPressed: () {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
