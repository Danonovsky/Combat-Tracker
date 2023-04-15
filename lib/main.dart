import 'package:combat_tracker/pages/manage_page.dart';
import 'package:combat_tracker/pages/preview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'pages/layout_page.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combat Tracker',
      debugShowCheckedModeBanner: false,
      routes: {
        PreviewPage.route: (context) => const PreviewPage(),
        ManagePage.route: (context) => const ManagePage(),
        LayoutPage.route: (context) => const LayoutPage()
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LayoutPage(),
    );
  }
}
