import 'dart:io';

import 'package:stakedos/app/core/base_import.dart';

import 'list_config.dart';

class CoreConfig {
  //Production Mode will disable every debug thing
  static final bool productionMode = false;

  static final bool isDesktopClient = Platform.isWindows || Platform.isLinux;
  static final bool isMacOS = !isDesktopClient && Platform.isMacOS;

  static final String _urlBaseAPILocal = 'http://127.0.0.1:8001';
  static final String _urlBaseAPIDebug = 'https://api.btwazure.com/btwedutech';
  static final String _urlBaseAPIProduction =
      'https://api.stakedos.com/stakedos';
  static final String _urlBaseCDN = 'https://btw-cdn.com/assets/v3';

  static bool getDebuggableConfig(String configName) {
    return !productionMode
        ? ListConfig.getConfigList[configName] ?? false
        : false;
  }

  static bool getFixedConfig(String configName) {
    return ListConfig.getConfigList[configName] ?? false;
  }

  static String getApiUrl({int version = 1}) {
    String topic = '${_urlBaseAPIProduction}/m/v${version}';
    if (!productionMode) {
      topic =
          '${getDebuggableConfig("is_local_server") ? _urlBaseAPILocal : getDebuggableConfig("is_debug_mode") ? _urlBaseAPIDebug : _urlBaseAPIProduction}/m/v${version}';
    }
    return topic;
  }

  static String get getEnvironment {
    String topic = "prod";
    if (!productionMode) {
      topic =
          '${getDebuggableConfig("is_local_server") ? 'local' : getDebuggableConfig("is_debug") ? 'dev' : 'prod'}';
    }
    return topic;
  }

  static String get getUrlCDN {
    return _urlBaseCDN;
  }
}
