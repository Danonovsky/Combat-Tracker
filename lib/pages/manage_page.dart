import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../shared/appbar.dart';

class ManagePage extends StatelessWidget {
  static const String route = '/manage';
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Combat Tracker - Manage'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Manage'),
          ],
        ),
      ),
    );
  }
}
