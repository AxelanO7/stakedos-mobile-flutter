// import 'package:btw/firebase_options_dev.dart';
// import 'package:stakedos/app/configs/core_config.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get_storage/get_storage.dart';

// class BaseServices {
//   loadService() async {
//     print('Booting up ...');
//     await GetStorage.init();
//     if (!CoreConfig.isDesktopClient) {
//       try {
//         await Firebase.initializeApp(
//             options: DefaultFirebaseOptions.currentPlatform);
//       } catch (ex) {
//         print(ex);
//       }
//     }
//   }

//   static systemLog(String key, String message) {
//     print("[$key]: $message");
//   }
// }
