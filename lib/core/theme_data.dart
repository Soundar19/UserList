// import 'package:flavor/app_resource.dart';
// import 'package:flavor/theme/app_text_field_style.dart';
// import 'package:flavor/theme/app_text_style.dart';
// import 'package:flutter/material.dart';
//
// class ThemeManager {
//   late AppTextStyle textStyle;
//   final ThemeMode _mode;
//
//   ThemeManager(this._mode) {
//     textStyle = _mode == ThemeMode.dark ? AppTextDark() : AppTextLight();
//   }
//
//   ThemeData get lightTheme {
//     return ThemeData(
//         primaryColor: AppResource.color.primaryColor,
//         colorScheme: ColorScheme.light(
//             primary: AppResource.color.primaryColor,
//             secondary: AppResource.color.secondaryColor),
//         scaffoldBackgroundColor: AppResource.color.whiteColor,
//         inputDecorationTheme: inputDecoration(textStyle),
//         unselectedWidgetColor: AppResource.color.greyHintColor,
//         disabledColor: AppResource.color.greyHintColor,
//         radioTheme: RadioThemeData(
//           fillColor: MaterialStateColor.resolveWith(
//               (states) => AppResource.color.greyHintColor),
//           overlayColor: MaterialStateColor.resolveWith(
//               (states) => AppResource.color.transparentColor),
//           visualDensity: const VisualDensity(
//             horizontal: VisualDensity.minimumDensity,
//             vertical: VisualDensity.minimumDensity,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all(AppResource.color.primaryColor),
//             minimumSize:
//                 MaterialStateProperty.all(const Size(double.infinity, 66)),
//             maximumSize:
//                 MaterialStateProperty.all(const Size(double.infinity, 66)),
//             textStyle: MaterialStateProperty.all(textStyle.textMediumWhite),
//             shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(32.0),
//               ),
//             ),
//             elevation: MaterialStateProperty.all(12.0),
//             shadowColor: MaterialStateProperty.all(
//                 AppResource.color.primaryColor.withOpacity(0.25)),
//           ),
//         ),
//         buttonTheme: ButtonThemeData(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(33.0),
//           ),
//           buttonColor: AppResource.color.primaryColor,
//         ),
//         textButtonTheme: TextButtonThemeData(
//           style: TextButton.styleFrom(
//               backgroundColor: AppResource.color.transparentColor,
//               elevation: 0.0,
//               disabledForegroundColor: AppResource.color.transparentColor,
//               foregroundColor: AppResource.color.transparentColor,
//               disabledBackgroundColor: AppResource.color.transparentColor,
//               textStyle: textStyle.textMediumWhite),
//         ),
//         outlinedButtonTheme: OutlinedButtonThemeData(
//             style: OutlinedButton.styleFrom(
//           minimumSize: const Size(double.infinity, 66),
//           maximumSize: const Size(double.infinity, 66),
//           textStyle: TextStyle(color: AppResource.color.borderButton),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//               side: BorderSide(
//                   color: AppResource.color.borderButton, width: 1.0)),
//         )));
//   }
//
//   ThemeData get darkTheme {
//     return ThemeData(
//         primaryColor: AppResource.color.primaryColor,
//         colorScheme: ColorScheme.light(
//             primary: AppResource.color.primaryColor,
//             secondary: AppResource.color.secondaryColor),
//         scaffoldBackgroundColor: AppResource.color.whiteColor,
//         inputDecorationTheme: inputDecoration(textStyle),
//         unselectedWidgetColor: AppResource.color.greyHintColor,
//         disabledColor: AppResource.color.greyHintColor,
//         radioTheme: RadioThemeData(
//           fillColor: MaterialStateColor.resolveWith(
//               (states) => AppResource.color.greyHintColor),
//           overlayColor: MaterialStateColor.resolveWith(
//               (states) => AppResource.color.transparentColor),
//           visualDensity: const VisualDensity(
//             horizontal: VisualDensity.minimumDensity,
//             vertical: VisualDensity.minimumDensity,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all(AppResource.color.blueColor),
//             minimumSize:
//                 MaterialStateProperty.all(const Size(double.infinity, 66)),
//             maximumSize:
//                 MaterialStateProperty.all(const Size(double.infinity, 66)),
//             textStyle: MaterialStateProperty.all(textStyle.textMediumWhite),
//             shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(32.0),
//               ),
//             ),
//             elevation: MaterialStateProperty.all(12.0),
//             shadowColor: MaterialStateProperty.all(
//                 AppResource.color.blueColor.withOpacity(0.25)),
//           ),
//         ),
//         buttonTheme: ButtonThemeData(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(33.0),
//           ),
//           buttonColor: AppResource.color.blueColor,
//         ),
//         textButtonTheme: TextButtonThemeData(
//           style: ButtonStyle(
//               backgroundColor:
//                   MaterialStateProperty.all(AppResource.color.blueColor),
//               elevation: MaterialStateProperty.all(0.0),
//               textStyle: MaterialStateProperty.all(textStyle.textMediumWhite)),
//         ),
//         outlinedButtonTheme: OutlinedButtonThemeData(
//             style: OutlinedButton.styleFrom(
//           minimumSize: const Size(double.infinity, 66),
//           maximumSize: const Size(double.infinity, 66),
//           textStyle: TextStyle(color: AppResource.color.borderButton),
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//               side: BorderSide(
//                   color: AppResource.color.borderButton, width: 1.0)),
//         )));
//   }
// }
//
// // extension ReverseThemeMode on ThemeMode {
// //   ThemeMode reverse() {
// //     var _themeMode = ThemeMode.system;
// //     switch (this) {
// //       case ThemeMode.light:
// //         _themeMode = ThemeMode.dark;
// //         break;
// //       case ThemeMode.dark:
// //         _themeMode = ThemeMode.light;
// //         break;
// //       case ThemeMode.system:
// //         _themeMode = ThemeMode.light;
// //         break;
// //     }
// //     return _themeMode;
// //   }
// // }
// //
// // extension ThemeModeValue on int {
// //   ThemeMode? toThemeModeValue() {
// //     ThemeMode? themeMode = null;
// //     switch (this) {
// //       case 0:
// //         themeMode = ThemeMode.light;
// //         break;
// //       case 1:
// //         themeMode = ThemeMode.dark;
// //         break;
// //     }
// //     return themeMode;
// //   }
// // }
// //
// // extension ThemeModeIntValue on ThemeMode {
// //   int toIntValue() {
// //     switch (this) {
// //       case ThemeMode.light:
// //         return 0;
// //       case ThemeMode.dark:
// //         return 1;
// //       case ThemeMode.system:
// //         return -1;
// //     }
// //   }
// // }
