import 'package:companion_for_virus/core/app_colors.dart';
import 'package:flutter/material.dart';

class SharedScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  const SharedScaffoldWidget({super.key, this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      backgroundColor: AppColors.themeBackgroundColor,
    );
  }
}
