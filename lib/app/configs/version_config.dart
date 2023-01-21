import 'dart:io';

import '../configs/core_config.dart';

class VersionConfig {
  static final int _androidVersion = 100;
  static final int _iosVersion = 100;
  static final int _desktopVersion = 100;
  static final String _iosAppId = '1541829332';
  static final String _androidAppId = 'com.bimbelbtw.skd';

  static int get getBuildNumber {
    if (Platform.isAndroid) {
      return _androidVersion;
    } else if (CoreConfig.isDesktopClient) {
      return _desktopVersion;
    } else {
      return _iosVersion;
    }
  }

  static String get iOSAppId {
    return _iosAppId;
  }

  static String get androidAppId {
    return _androidAppId;
  }
}
