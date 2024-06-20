import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:network/src/app_settings/mobile_os.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppSettings {
  final companyUno = 1;
  final languageUno = 1033;
  final smsOrNotificationUno = 188;
  final mobileApplicationUno = 78;
  String? deviceVersionValue;
  int? versionCodeValue;

  AppSettings._();

  static AppSettings? appSettingsInstance;

  factory AppSettings() {
    appSettingsInstance ??= AppSettings._();
    return appSettingsInstance!;
  }

  MobileOSType get mobileOs {
    if (Platform.isAndroid) {
      return MobileOSType.Android;
    } else if (Platform.isIOS) {
      return MobileOSType.IOS;
    } else {
      return MobileOSType.CE;
    }
  }

  Future<void> getDeviceVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceVersionValue = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceVersionValue = iosInfo.utsname.machine;
    } else {
      deviceVersionValue = "Unknown";
    }
    return;
  }

  getVersionCode() async {
    final platformInfo = await PackageInfo.fromPlatform();
    versionCodeValue = int.parse(platformInfo.buildNumber);
  }

  int get versionCode {
    return versionCodeValue ?? 0;
  }

  String get deviceVersion {
    return deviceVersionValue ?? '';
  }
}
