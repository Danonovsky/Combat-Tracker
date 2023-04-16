import 'package:combat_tracker/pages/home/home_page.dart';
import 'package:combat_tracker/pages/manage/manage_page.dart';
import 'package:flutter/material.dart';

import '../pages/preview/preview_page.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Widget> navItems = [
      TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(ManagePage.route),
        child: const Text("Manage"),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(PreviewPage.route),
        child: const Text("Preview"),
      ),
    ];
    var mobile = MediaQuery.of(context).size.width < 700;
    return AppBar(
      automaticallyImplyLeading: false,
      title: TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(HomePage.route),
        child: Text(title),
      ),
      actions: mobile ? null : navItems,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
