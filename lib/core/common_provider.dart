// import 'package:base/core/utilities/permission_manager.dart';
// import 'package:flavor/theme/theme_data.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shared_pref/app_db.dart';
// import 'package:shared_pref/hive_helper.dart';
//
// var themeControllerProvider = StateNotifierProvider<ThemeController, ThemeMode>(
//     (ref) => ThemeController());
//
// class ThemeController extends StateNotifier<ThemeMode> {
//   ThemeController() : super(ThemeMode.system);
//
//   void toggleTheme() {
//     state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//   }
// }
//
// var themeManagerProvider = Provider((ref) {
//   ThemeMode mode = ref.watch(themeControllerProvider);
//   return ThemeManager(mode);
// });
//
// final appDbProvider = Provider((ref) {
//   return AppDB(HiveHelper().appBox);
// });
// final permissionManagerProvider = Provider((ref) {
//   return PermissionManager();
// });
