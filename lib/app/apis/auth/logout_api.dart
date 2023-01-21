// import 'dart:convert';

// import 'package:btw/src/core/base_api.dart';
// import 'package:btw/src/core/base_import.dart';

// class LogoutApi extends BaseApi {
//   String url = CoreConfig.getApiUrl() + '/auth/logout';

//   Future<ResultApi> request() async {
//     String fcmToken = await AuthUtils.getFCMToken();

//     requestPayload = {
//       "fcm_token": fcmToken,
//     };

//     if (CoreConfig.getDebuggableConfig("is_debug_mode"))
//       LogUtils.log(requestPayload);

//     try {
//       await generateHeader(withToken: true);

//       var response = await post(Uri.parse(url),
//           body: json.encode(requestPayload), headers: requestHeaders);

//       checkResponse(response);

//       responseData.statusCode = response.statusCode;
//       if (checkStatus200(response)) {
//         responseData.status = true;
//       }
//     } catch (e) {
//       printError(e);
//     }
//     return responseData;
//   }
// }
