import 'package:flutter/material.dart';

class Entity {
  String name = 'default';
  int hp = 10;
  int maxHp = 10;
  bool showHp = false;
  String status = 'Alive';
  Color color = Colors.lightGreen;
  int initiative = 0;

  double get displayHp => showHp ? hp / maxHp : 1.0;
  String get displayStatus => '$status${showHp ? ' ($hp/$maxHp)' : ''}';

  Entity();
  Entity.from({
    required this.name,
    required this.hp,
    required this.maxHp,
    this.initiative = 0,
  });
}
