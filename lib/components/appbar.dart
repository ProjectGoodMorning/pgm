import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  const MyAppBar({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AppBar(
        title: Text(
          'Project Good Morning | $pageTitle',
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier',
              color: Color.fromARGB(189, 37, 37, 37)),
        ),
        backgroundColor:
            const Color.fromARGB(219, 71, 177, 162).withOpacity(0.5),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
