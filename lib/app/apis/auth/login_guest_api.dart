// import 'dart:convert';
// import 'dart:io';

// import 'package:btw/src/core/base_api.dart';
// import 'package:btw/src/core/base_import.dart';

// class LoginGuestPTNPayload {
//   final int schoolID;
//   final int studyProgramId;
//   final int studentGender;
//   final String studentName;
//   final int lastEducationID;
//   final String lastSchoolName;
//   final String lastSchoolID;
//   final int studentProvinceID;
//   final int studentRegionID;
//   final int avatarStyle;

//   LoginGuestPTNPayload({
//     required this.schoolID,
//     required this.studyProgramId,
//     required this.studentGender,
//     required this.studentName,
//     required this.lastEducationID,
//     required this.lastSchoolName,
//     required this.lastSchoolID,
//     required this.studentProvinceID,
//     required this.studentRegionID,
//     required this.avatarStyle,
//   });
// }

// class LoginGuestPTKPayload {
//   final int schoolID;
//   final int studyProgramId;
//   final int studentGender;
//   final String studentName;
//   final int lastEducationID;
//   final String lastSchoolName;
//   final String lastSchoolID;
//   final int studentProvinceID;
//   final int studentRegionID;
//   final int avatarStyle;
//   final bool studentColorBlind;
//   final double studentHeight;
//   final String studentBirthDate;

//   LoginGuestPTKPayload(
//       {required this.schoolID,
//       required this.studyProgramId,
//       required this.studentGender,
//       required this.studentName,
//       required this.lastEducationID,
//       required this.lastSchoolName,
//       required this.lastSchoolID,
//       required this.studentProvinceID,
//       required this.studentRegionID,
//       required this.avatarStyle,
//       required this.studentHeight,
//       required this.studentBirthDate,
//       required this.studentColorBlind});
// }

// class LoginGuestApi extends BaseApi {
//   String url = CoreConfig.getApiUrl() + '/login/guest';

//   Future<ResultApi> request({
//     required String program,
//     LoginGuestPTNPayload? ptnPayload,
//     LoginGuestPTKPayload? ptkPayload,
//   }) async {
//     String fcmToken = await AuthUtils.getFCMToken();
//     String userIdentifier = await DeviceUtils.getDeviceUniqueID() ?? "";

//     if (program == "ptn") {
//       if (ptnPayload == null) {
//         return responseData;
//       }
//     } else {
//       if (ptkPayload == null) {
//         return responseData;
//       }
//     }

//     requestPayload = program == "ptn"
//         ? {
//             "device_type": Platform.isIOS ? "IOS" : "ANDROID",
//             "accept_term_condition": 1,
//             "user_identifier": userIdentifier,
//             "fcm_token": fcmToken,
//             "school_id": ptnPayload?.schoolID,
//             "study_program_id": ptnPayload?.studyProgramId,
//             "student_target": "PTN",
//             "guest_gender": ptnPayload?.studentGender,
//             "guest_name": ptnPayload?.studentName,
//             "guest_last_education_id": ptnPayload?.lastEducationID,
//             "guest_last_school_name": ptnPayload?.lastSchoolName,
//             "guest_last_school_id": ptnPayload?.lastSchoolID,
//             "guest_province_id": ptnPayload?.studentProvinceID,
//             "guest_region_id": ptnPayload?.studentRegionID,
//             "style": ptnPayload?.avatarStyle
//           }
//         : {
//             "device_type": Platform.isIOS ? "IOS" : "ANDROID",
//             "accept_term_condition": 1,
//             "user_identifier": userIdentifier,
//             "school_id": ptkPayload?.schoolID,
//             "study_program_id": ptkPayload?.studyProgramId,
//             "student_target": "PTK",
//             "guest_gender": ptkPayload?.studentGender,
//             "guest_name": ptkPayload?.studentName,
//             "guest_birth_date": ptkPayload?.studentBirthDate,
//             "guest_color_blind": ptkPayload?.studentColorBlind,
//             "guest_height": ptkPayload?.studentHeight,
//             "guest_last_education_id": ptkPayload?.lastEducationID,
//             "guest_last_school_name": ptkPayload?.lastSchoolName,
//             "guest_last_school_id": ptkPayload?.lastSchoolID,
//             "guest_province_id": ptkPayload?.studentProvinceID,
//             "guest_region_id": ptkPayload?.studentRegionID,
//             "style": ptkPayload?.avatarStyle
//           };

//     if (CoreConfig.getDebuggableConfig("is_debug_mode")) print(requestPayload);

//     try {
//       var response = await post(Uri.parse(url),
//           body: json.encode(requestPayload), headers: requestHeaders);

//       checkResponse(response);

//       responseData.statusCode = response.statusCode;
//       if (checkStatus200(response)) {
//         var responseBody = json.decode(response.body);
//         var data = LoginResponse.fromJson(responseBody);
//         responseData.status = true;
//         responseData.data = data.data;
//         responseData.message = data.messages.first ?? '';
//       }
//     } catch (e) {
//       printError(e);
//     }
//     return responseData;
//   }
// }
