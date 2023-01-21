// import 'dart:convert';

// import 'package:btw/src/core/base_api.dart';
// import 'package:btw/src/core/base_import.dart';

// class ForgotPasswordApi extends BaseApi {
//   String url = CoreConfig.getApiUrl() + '/auth/forget-password';

//   Future<ResultApi> request({
//     required String email,
//   }) async {
//     requestPayload = {"email": email, "recaptcha": "asdasdasd"};
//     if (CoreConfig.getDebuggableConfig("is_debug_mode"))
//       LogUtils.log(requestPayload);
//     try {
//       var response = await post(Uri.parse(url),
//           body: json.encode(requestPayload), headers: requestHeaders);

//       checkResponse(response);

//       responseData.statusCode = response.statusCode;

//       if (checkStatus200(response)) {
//         var responseBody = json.decode(response.body);
//         var data = ForgotPasswordResponse.fromJson(responseBody);
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
