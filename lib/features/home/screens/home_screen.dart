import 'package:companion_for_virus/core/app_colors.dart';
import 'package:companion_for_virus/core/router/app_routes.dart';
import 'package:companion_for_virus/features/home/poviders/home_view_is_grid.dart';
import 'package:companion_for_virus/features/home/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> isGridAsync = ref.watch(homeViewIsGridProvider);
    final bool isGrid = isGridAsync.value ?? true;
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
            onTap: () => context.push(AppRoutes.officialCards),
          ),
          MenuCardWidget(
            isGrid: isGrid,
            title: "Fan Cards",
            icon: Icons.people_rounded,
            color: AppColors.menuFanCardsBackgroundColor,
            onTap: () => context.push(AppRoutes.fanCards),
          ),
          MenuCardWidget(
            isGrid: isGrid,
            title: "Rules",
            icon: Icons.menu_book_rounded,
            color: AppColors.menuRulesBackgroundColor,
            onTap: () => context.push(AppRoutes.rules),
          ),
          MenuCardWidget(
            isGrid: isGrid,
            title: "FAQ",
            icon: Icons.help_outline_rounded,
            color: AppColors.menuFaqBackgroundColor,
            onTap: () => context.push(AppRoutes.faq),
          ),
        ],
      ),
    );
  }
}
