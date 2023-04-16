import 'package:combat_tracker/pages/home/home_page.dart';
import 'package:combat_tracker/pages/manage/manage_page.dart';
import 'package:combat_tracker/pages/preview/preview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

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
        HomePage.route: (context) => const HomePage()
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
