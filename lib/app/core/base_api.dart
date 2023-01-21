import 'dart:convert';

import 'package:stakedos/app/core/base_import.dart' hide Response;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
export 'package:http/http.dart';

class BaseApi {
  ResultApi responseData = new ResultApi()..status = false;
  String url = '';
  var requestPayload;
  String accessToken = '';
  var requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  printError(dynamic e) {
    if (e != null && e.toString().toLowerCase().contains('api.')) {
      responseData.message =
          'Terjadi masalah, silahkan cek jaringan anda dan coba lagi (${responseData.statusCode})';
    } else {
      responseData.message = e.toString();
    }
    // if (!FeatureConfig.isDesktop) {
    //   FirebaseCrashlytics.instance
    //       .setCustomKey('api_error', '$runtimeType : ${e.toString()}');
    // }
    // if (FeatureConfig.isOnKitchen) {
    //   print('Error Parsing API $runtimeType :$url');
    //   print('Error : $e');
    // }
    // DataService.getDebugMode().then((value) {
    //   if (value) {
    //     AlertHelper.showAlertError(e.toString(),
    //         title: 'Error Parsing API', alertType: AlertType.dialog);
    //   }
    // });
  }

  checkResponse(Response response) async {
    if (CoreConfig.getDebuggableConfig("is_debug_mode") &&
        CoreConfig.getDebuggableConfig("log_api_response")) {
      print('Api Response ${response.statusCode} : $url');
      print(response.body);
    }
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) if (response
            .statusCode !=
        200) {
      if (!(Get.isSnackbarOpen)) {
        Get.snackbar('Error ${response.statusCode}', '${response.body}',
            snackStyle: SnackStyle.FLOATING);
      }
    }

    String? message;
    if (response.statusCode != 500) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      message = responseBody.containsKey('message')
          ? responseBody['message'] is String
              ? responseBody['message']
              : null
          : null;
      if (responseBody.containsKey('message')) {
        if (responseBody['message'] is List<dynamic>) {
          List<dynamic> msgs = responseBody['message'];
          if (msgs.length > 0) {
            message = msgs.first?.toString() ?? '';
          }
        } else {
          message = responseBody['message']?.toString();
        }
      }
      if (responseBody.containsKey('messages')) {
        if (responseBody['messages'] is List<dynamic>) {
          List<dynamic> msgs = responseBody['messages'];
          if (msgs.length > 0) {
            message = msgs.first?.toString() ?? '';
          }
        } else {
          message = responseBody['messages']?.toString();
        }
      }
      if (message != null && message.toLowerCase().contains('api.')) {
        responseData
          ..message =
              'Terjadi masalah, silahkan cek jaringan kamu dan coba lagi (${responseData.statusCode})';
      } else {
        responseData..message = message ?? '';
      }
    }
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 302 ||
        response.statusCode == 422 ||
        response.statusCode == 400) {
      //free to go
      //422 do validation in api class
      if ((response.statusCode == 400 || response.statusCode == 302)) {
        // AlertHelper.showAlertErrorStatus('no-connection',
        //     errorMessage:
        //         'Terjadi kesalahan, cek koneksimu dan coba ulangi beberapa saat lagi (${returnErrorCode(resultApi.statusCode)}). ${kReleaseMode ? '' : runtimeType}');
      }
    } else if (response.statusCode == 401 ||
        (response.statusCode == 402 && message == "Unauthorized")) {
      if (!(Get.isDialogOpen ?? false)) {
        // bool isLogged = await AuthService.isLogin();
        // if (Get.find<ConstantsService>().isLoggedOut || !isLogged) {
        //   return;
        // }
        // Get.find<ConstantsService>()..isLoggedOut = true;
        // await AlertHelper.dialog(
        //     'Sesi kamu telah berakhir. Silahkan login kembali (${returnErrorCode(resultApi.statusCode)}).',
        //     canHide: false);
        // // await AuthService.removeSession();
        // MiscHelper.doLogout();
        // await Get.offAllNamed(AppRoutes.loginPage);
        // Get.find<ConstantsService>()..isLoggedOut = false;
      }
    } else if (response.statusCode >= 500) {
      // if (showFailMessage) {
      //   AlertHelper.showAlertErrorStatus('no-connection',
      //       errorMessage:
      //           'Terjadi kesalahan, cek koneksimu dan coba ulangi beberapa saat lagi (${returnErrorCode(resultApi.statusCode)}). ${kReleaseMode ? '' : runtimeType}');
      // }
    } else {
      // if (!kReleaseMode) {
      //   print(json.decode(response.body));
      // }
    }
  }

  checkStatus200(Response response) {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      doNext = true;
    } else if (response.statusCode == 422) {
      var responseBody = json.decode(response.body);
      var data = ErrorLaravelResponse.fromJson(responseBody);
      responseData.errors = data.data.errors;
    }
    return doNext;
  }

  checkStatus200B(Response response) {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      doNext = true;
    } else if (response.statusCode == 422) {
      var responseBody = json.decode(response.body);
      var data = ErrorLaravelGenericResponse.fromJson(responseBody);
      responseData.data = data.data;
    }
    return doNext;
  }

  checkStatus200X(StreamedResponse response) async {
    bool doNext = false;
    if (response.statusCode == 200 || response.statusCode == 201) {
      String msx = await response.stream.bytesToString();
      Map<String, dynamic> responseBody = json.decode(msx);
      String message =
          responseBody.containsKey('message') ? responseBody['message'] : '';
      List<dynamic> messages =
          responseBody.containsKey('messages') ? responseBody['messages'] : '';
      responseData.message =
          messages.first != null ? messages.first.toString() : message;
      doNext = true;
    }
    return doNext;
  }

  generateHeader({bool withToken: true, String? token}) async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // headers['AppVersion'] = packageInfo.version +
    //     '.' +
    //     packageInfo.buildNumber +
    //     (FeatureConfig.isMacOS
    //         ? '_MACOS'
    //         : !FeatureConfig.isDesktop
    //             ? (Platform.isIOS ? "_IOS" : "_ANDROID")
    //             : '_DESKTOPCLIENT');
    // // } else {
    // //   headers['AppVersion'] = '3.2_DesktopClient';
    // // }
    if (withToken) {
      var token = await AuthUtils.getAppToken();
      accessToken = token;
      requestHeaders['Authorization'] = 'Bearer $accessToken';
    }
    if (token != null) {
      accessToken = token;
      requestHeaders['Authorization'] = 'Bearer $accessToken';
    }
    if (kReleaseMode == false) {
      print(accessToken);
    }
  }

  // Future<bool> cacheResponse(String key, String responses) async {
  //   var result = await DatabaseService().insertResponses(
  //       ResponsesTable.fromMap({
  //     "key": key,
  //     "responses": CryptographyHelper().encryptWord(responses)
  //   }));
  //   if (result == 0) {
  //     return true;
  //   }
  //   return false;
  // }

  // Future<String?> getResponse(String key) async {
  //   var result = await DatabaseService().getResponsesByKey(key);
  //   String? responses;
  //   if (result != null) {
  //     try {
  //       responses = CryptographyHelper().decryptWord(result['responses']);
  //     } catch (ex) {}
  //     return responses;
  //   }
  //   return responses;
  // }

  // clearResponses(String key) async {
  //   await DatabaseService().removeResponses(key);
  // }
}
