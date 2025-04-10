import 'package:companion_for_virus/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SharedAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool settings;
  final bool isHome;

  const SharedAppBarWidget({
    super.key,
    required this.title,
    this.settings = true,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          if (isHome)
            const Text(
              "Campanion for",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        if (settings)
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(AppRoutes.settings),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(isHome ? 56.0 : 46.0);
}
