import 'dart:convert';

import 'package:stakedos/app/core/base_api.dart';
import 'package:stakedos/app/core/base_import.dart';

class PostStatusKehadiranApi extends BaseApi {
  String url =
      'https://stakedos-23d7b-default-rtdb.asia-southeast1.firebasedatabase.app/testList/data.json';

  Future<ResultApi> request() async {
    if (CoreConfig.getDebuggableConfig("is_debug_mode"))
      LogUtils.log(requestPayload);

    try {
      // await generateHeader(withToken: true);

      var response = await post(Uri.parse(url));
      // headers: requestHeaders

      checkResponse(response);
      // print(response.statusCode);
      // print(responseData.listData);

      responseData.statusCode = response.statusCode;
      if (checkStatus200(response)) {
        var responseBody = json.decode(response.body);
        var data = GetStatusKehadiranResponse.fromJson(responseBody);
        responseData.status = true;
        // responseData.listData = data.data;
        responseData.message = data.messages?.first;
      }
    } catch (e) {
      printError(e);
    }
    return responseData;
  }
}
