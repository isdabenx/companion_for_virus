import 'package:companion_for_virus/core/app_colors.dart';
import 'package:companion_for_virus/core/router/app_routes.dart';
import 'package:companion_for_virus/features/home/widgets/icon_toogle_grid.dart';
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
      backgroundColor: AppColors.appBarBackgroundColor,
      elevation: 2,
      leading: isHome ? IconToogleGrid() : null,
      title: Column(
        children: [
          if (isHome)
            const Text(
              "Campanion for",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: AppColors.appBarTextColor,
              ),
            ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarTextColor,
            ),
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
