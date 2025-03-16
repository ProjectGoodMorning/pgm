import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget implements PreferredSizeWidget {
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 120, // Adjust height here
          padding: const EdgeInsets.all(16),
          decoration:
              const BoxDecoration(color: Color.fromARGB(219, 71, 177, 162)),
          alignment: Alignment.centerLeft,
          child: const Text(
            'PGM | Menu',
            style: TextStyle(fontSize: 30, fontFamily: "Courier"),
          ),
        ),
        ListTile(
          tileColor: const Color.fromARGB(221, 241, 144, 26),
          title: const Text('Home',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Courier",
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          tileColor: const Color.fromARGB(221, 241, 241, 26),
          title: const Text('Settings',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Courier",
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
