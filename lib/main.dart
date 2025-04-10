import 'package:companion_for_virus/core/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Companion for Virus!",
      routerConfig: appRouter,
    );
  }
}
