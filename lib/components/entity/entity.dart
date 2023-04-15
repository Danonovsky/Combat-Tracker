class Entity {
  String name = 'default';
  int hp = 10;
  int maxHp = 10;
  bool showHp = false;
  String status = 'Alive';
  int initiative = 0;

  String get displayStatus => '$status${showHp ? ' ($hp/$maxHp)' : ''}';
}
