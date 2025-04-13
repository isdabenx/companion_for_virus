import 'package:companion_for_virus/core/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_is_grid.g.dart';

@riverpod
class HomeViewIsGrid extends _$HomeViewIsGrid {
  static const String _key = 'home_view_is_grid';

  @override
  Future<bool> build() async {
    final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
    return sharedPreferences.getBool(_key) ?? true;
  }

  Future<void> toogle() async {
    final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
    final newValue = !(state.value ?? true);
    await sharedPreferences.setBool(_key, newValue);
    state = AsyncValue.data(newValue);
  }
}
