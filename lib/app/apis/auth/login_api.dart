import 'dart:convert';
import 'dart:io';

import 'package:stakedos/app/core/base_api.dart';
import 'package:stakedos/app/core/base_import.dart';

class LoginApi extends BaseApi {
  String url = CoreConfig.getApiUrl() + '/login';

  Future<ResultApi> request({
    required String emailOrWhatsapp,
    required String password,
  }) async {
    String fcmToken = await AuthUtils.getFCMToken();

    requestPayload = {
      "username": emailOrWhatsapp,
      "password": password,
      "fcm_token": fcmToken,
      "device_type": Platform.isIOS ? "IOS" : "ANDROID"
    };

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) print(requestPayload);

    try {
      var response = await post(Uri.parse(url),
          body: json.encode(requestPayload), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = LoginResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data.data;
        responseData.message = data.messages.first ?? '';
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }

  Future<ResultApi> requestThirdPartyAuth({
    required String authType,
    required String authToken,
  }) async {
    String fcmToken = await AuthUtils.getFCMToken();

    requestPayload = {
      "auth_type": authType,
      "auth_token": authToken,
      "fcm_token": fcmToken
    };

    if (CoreConfig.getDebuggableConfig("is_debug_mode")) print(requestPayload);

    try {
      var response = await post(Uri.parse(url),
          body: json.encode(requestPayload), headers: requestHeaders);

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = LoginResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.data = data.data;
        responseData.message = data.messages.first ?? '';
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
