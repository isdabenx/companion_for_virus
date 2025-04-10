import 'package:companion_for_virus/core/router/app_routes.dart';
import 'package:companion_for_virus/features/home/screens/home_screen.dart';
import 'package:companion_for_virus/features/splash/screens/splash_screen.dart';
import 'package:companion_for_virus/shared/widgets/shared_app_bar_widget.dart';
import 'package:companion_for_virus/shared/widgets/shared_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.home,
      builder:
          (context, state) => SharedScaffoldWidget(
            appBar: SharedAppBarWidget(title: "Virus!", isHome: true),
            body: const HomeScreen(),
          ),
    ),
    GoRoute(
      path: AppRoutes.officialCards,
      name: AppRoutes.officialCards,
      builder: (context, state) => const Placeholder(color: Colors.green),
    ),
    GoRoute(
      path: AppRoutes.officialCardDetails,
      name: AppRoutes.officialCardDetails,
      builder: (context, state) => const Placeholder(color: Colors.orange),
    ),
    GoRoute(
      path: AppRoutes.rules,
      name: AppRoutes.rules,
      builder: (context, state) => const Placeholder(color: Colors.yellow),
    ),
    GoRoute(
      path: AppRoutes.fanCards,
      name: AppRoutes.fanCards,
      builder: (context, state) => const Placeholder(color: Colors.purple),
    ),
    GoRoute(
      path: AppRoutes.faq,
      name: AppRoutes.faq,
      builder: (context, state) => const Placeholder(color: Colors.brown),
    ),
    GoRoute(
      path: AppRoutes.settings,
      name: AppRoutes.settings,
      builder: (context, state) => const Placeholder(color: Colors.grey),
    ),
  ],
);
