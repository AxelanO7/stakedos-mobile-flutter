import 'dart:io';
import 'dart:math';

// import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtils {
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random _rnd = Random();

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
//   static Future<String?> getDeviceUniqueID() async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     if (Platform.isIOS) {
//       var iosDeviceInfo = await deviceInfo.iosInfo;
//       return iosDeviceInfo.identifierForVendor;
//     } else if (Platform.isAndroid) {
//       var androidDeviceInfo = await deviceInfo.androidInfo;
//       return androidDeviceInfo.id;
//     }
//     return null;
//   }
}
