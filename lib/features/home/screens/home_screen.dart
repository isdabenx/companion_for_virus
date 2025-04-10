import 'package:companion_for_virus/core/app_colors.dart';
import 'package:companion_for_virus/core/router/app_routes.dart';
import 'package:companion_for_virus/features/home/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isGrid = false;
    return Center(
      child: GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: isGrid ? 2 : 1,
        childAspectRatio: isGrid ? 1 : 4,
        children: [
          MenuCardWidget(
            isGrid: isGrid,
            title: "Official Cards",
            icon: Icons.view_carousel_rounded,
            color: AppColors.menuOfficialCardsBackgroundColor,
            onTap: () => context.push(AppRoutes.splash),
          ),
          MenuCardWidget(
            isGrid: isGrid,
            title: "Fan Cards",
            icon: Icons.people_rounded,
            color: AppColors.menuFanCardsBackgroundColor,
            onTap: () => context.push(AppRoutes.splash),
          ),
          MenuCardWidget(
            isGrid: isGrid,
            title: "Rules",
            icon: Icons.menu_book_rounded,
            color: AppColors.menuRulesBackgroundColor,
            onTap: () => context.push(AppRoutes.splash),
          ),
          MenuCardWidget(
            isGrid: isGrid,
            title: "FAQ",
            icon: Icons.help_outline_rounded,
            color: AppColors.menuFaqBackgroundColor,
            onTap: () => context.push(AppRoutes.splash),
          ),
        ],
      ),
    );
  }
}
