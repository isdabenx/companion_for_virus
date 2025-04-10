import 'package:companion_for_virus/core/app_colors.dart';
import 'package:flutter/material.dart';

class MenuCardWidget extends StatelessWidget {
  final bool isGrid;
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const MenuCardWidget({
    super.key,
    required this.isGrid,
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius = 16.0;

    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: color,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final iconSize = constraints.maxWidth * (isGrid ? 0.5 : 0.19);
              final textSize = constraints.maxWidth * (isGrid ? 0.17 : 0.1);
              final spacing = constraints.maxWidth * 0.05;

              return isGrid
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: iconSize,
                        color: AppColors.menuTextColor,
                      ),
                      SizedBox(height: spacing),
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColors.menuTextColor,
                          fontSize: textSize,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ],
                  )
                  : Row(
                    children: [
                      Icon(
                        icon,
                        size: iconSize,
                        color: AppColors.menuTextColor,
                      ),
                      SizedBox(width: spacing),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: AppColors.menuTextColor,
                            fontSize: textSize,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Helvetica',
                          ),
                        ),
                      ),
                    ],
                  );
            },
          ),
        ),
      ),
    );
  }
}
