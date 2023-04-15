import 'package:combat_tracker/shared/appbar.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  static const String route = '';
  const LayoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Combat Tracker'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('You have pushed the button this many times:'),
          ],
        ),
      ),
    );
  }
}
