import 'package:flutter/material.dart';
import '../shared/appbar.dart';

class PreviewPage extends StatefulWidget {
  static const String route = '/preview';
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Combat Tracker - Preview'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Preview'),
          ],
        ),
      ),
    );
  }
}
