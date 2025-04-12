import 'package:companion_for_virus/features/home/poviders/home_view_is_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconToogleGrid extends ConsumerWidget {
  const IconToogleGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> isGridAsync = ref.watch(homeViewIsGridProvider);
    final bool isGrid = isGridAsync.value ?? true;

    return IconButton(
      onPressed: () => {ref.read(homeViewIsGridProvider.notifier).toogle()},
      icon: Icon(isGrid ? Icons.grid_view_rounded : Icons.view_list_rounded),
    );
  }
}
