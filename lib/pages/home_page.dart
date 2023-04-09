
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> navItems = [
    TextButton(onPressed: () {}, child: const Text("Manage")),
    TextButton(onPressed: () {}, child: const Text("Preview")),
  ];

  @override
  Widget build(BuildContext context) {
    var mobile = MediaQuery.of(context).size.width < 700;
    return Scaffold(
      appBar: AppBar(
        title: TextButton(onPressed: () {}, child: Text(widget.title)),
        actions: mobile ? null : navItems,
      ),
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
