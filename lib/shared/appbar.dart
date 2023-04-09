import 'package:flutter/material.dart';

import '../pages/preview_page.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar({super.key, required this.title});
  final String title;
  final List<Widget> navItems = [
    TextButton(onPressed: () {}, child: const Text("Manage")),
    TextButton(onPressed: () {}, child: const Text("Preview")),
  ];

  @override
  Widget build(BuildContext context) {
    var mobile = MediaQuery.of(context).size.width < 700;
    return AppBar(
      title: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PreviewPage(),
            ));
          },
          child: Text(title)),
      actions: mobile ? null : navItems,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
