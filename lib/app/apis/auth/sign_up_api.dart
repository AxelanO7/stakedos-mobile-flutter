// import 'dart:convert';
// import 'dart:io';

// import 'package:btw/src/core/base_api.dart';
// import 'package:btw/src/core/base_import.dart';

// class SignUpApi extends BaseApi {
//   String url = CoreConfig.getApiUrl() + '/auth/register';

//   Future<ResultApi> request(
//       {required String email,
//       required String name,
//       required String password,
//       required String passwordConfirmation,
//       required String waNumber,
//       String? refCode}) async {
//     String fcmToken = await AuthUtils.getFCMToken();
//     requestPayload = {
//       "email": email,
//       "name": name,
//       "password": password,
//       "password_confirmation": passwordConfirmation,
//       "wa_number": waNumber,
//       "accept_term_condition": 1,
//       "recaptcha": "asadasd",
//       "fcm_token": fcmToken,
//       "device_type": Platform.isIOS ? "IOS" : "ANDROID"
//     };

//     if (CoreConfig.getDebuggableConfig("is_debug_mode"))
//       LogUtils.log(requestPayload);

//     try {
//       var response = await post(Uri.parse(url),
//           body: json.encode(requestPayload), headers: requestHeaders);

//       checkResponse(response);

//       responseData.statusCode = response.statusCode;

//       if (checkStatus200(response)) {
//         var responseBody = json.decode(response.body);
//         var data = SignUpResponse.fromJson(responseBody);
//         responseData.status = true;
//         responseData.data = data.data;
//         responseData.message = data.messages.first;
//       }
//     } catch (e) {
//       printError(e);
//     }
//     return responseData;
//   }
// }
