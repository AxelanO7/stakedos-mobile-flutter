import 'dart:convert';

import 'package:stakedos/app/core/base_api.dart';
import 'package:stakedos/app/core/base_import.dart';

class GetStatusKehadiranApi extends BaseApi {
  String url = 'https://reqres.in/api/users?page=1';

  Future<ResultApi> request() async {
    if (CoreConfig.getDebuggableConfig("is_debug_mode"))
      LogUtils.log(requestPayload);

    try {
      // await generateHeader(withToken: true);

      var response = await get(
        Uri.parse(url),
        // headers: requestHeaders
      );

      checkResponse(response);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GetStatusKehadiranResponse.fromJson(responseBody);
        responseData.status = true;
        responseData.listData = data.data;
        responseData.message = data.messages?.first;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
