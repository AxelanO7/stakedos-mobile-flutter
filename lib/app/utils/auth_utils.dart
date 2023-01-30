// import 'package:stakedos/app/apis/auth/login_api.dart';
// import 'package:stakedos/app/apis/auth/login_guest_api.dart';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:stakedos/app/apis/auth/login_api.dart';
import 'package:stakedos/app/models/index.dart';

import 'settings_utils.dart';

class AuthUtils {
  static final String _skLogin = 'is_login';
  static final String _skGuest = 'is_guest_mode';
  static final String _skMobileToken = 'token';
  static final String _skUserImage = 'user-image';
  static final String _skUserName = 'user-name';
  static final String _skGoogleLogin = 'google_auth';
  static final String _skAppleLogin = 'apple_auth';
  static final String _skFacebookLogin = 'facebook_auth';
  static final String _skUserId = 'user-id';
  static final String _skFCMToken = 'fcm_token';
  static final String _skUserEmail = 'user-email';
  static final String _skUserPhone = 'user-phone';
  static final String _skGoogleSign = 'google';

  static List username = ['user1', 'user2', 'user3'];
  List password = ['pass1', 'pass2', 'pass3'];

  // static Future<bool> doGuestLogin(String program, LoginGuestPTNPayload? ptnPayload,
  //     LoginGuestPTKPayload? ptkPayload) async {
  //   var result = await LoginGuestApi().request(
  //       program: program, ptnPayload: ptnPayload, ptkPayload: ptkPayload);
  //   if (result.status) {
  //     var data = result.data as Login;
  //     await AuthUtils.setMobileToken(data.token);
  //     await setLoggedIn(true);
  //     await setGuest(true);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static doLogout() async {
    await SettingsUtils.remove(_skMobileToken);
    await SettingsUtils.remove(_skUserId);
    await SettingsUtils.remove(_skLogin);
  }

  static doLogin(String userIdentifier, String password) async {
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/user');
    var userAuthData = await fAuthRef.get();
    var respJson = json.encode(userAuthData.value);
    Map<String, dynamic> rawData = json.decode(respJson);
    var isLoggedIn = false;
    rawData.forEach((key, value) async {
      UserAccount userData = UserAccount.fromJson(value);
      if (userData.username == userIdentifier &&
          userData.password == password) {
        await setMobileToken(userData.token ?? "");
        await setUserId(userData.id.toString());
        isLoggedIn = true;
      }
    });
    return isLoggedIn;
  }

  // static doThirdParyLogin(String authType, String authToken) async {
  //   var result = await LoginApi()
  //       .requestThirdPartyAuth(authType: authType, authToken: authToken);
  //   if (result.status) {
  //     var data = result.data as Login;
  //     await AuthUtils.setMobileToken(data.token);
  //     await setLoggedIn(true);
  //     await setGuest(false);
  //     switch (authType.toLowerCase()) {
  //       case "google":
  //         await setGoogleAuth();
  //         break;
  //       case "apple":
  //         await setAppleAuth();
  //         break;
  //       case "facebook":
  //         await setFacebookAuth();
  //         break;
  //     }
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static setGoogleAuth() async {
    await SettingsUtils.setBool(_skGoogleLogin, true);
    await SettingsUtils.setBool(_skAppleLogin, false);
    await SettingsUtils.setBool(_skFacebookLogin, false);
  }

  static setAppleAuth() async {
    await SettingsUtils.setBool(_skGoogleLogin, false);
    await SettingsUtils.setBool(_skAppleLogin, true);
    await SettingsUtils.setBool(_skFacebookLogin, false);
  }

  static setFacebookAuth() async {
    await SettingsUtils.setBool(_skGoogleLogin, false);
    await SettingsUtils.setBool(_skAppleLogin, false);
    await SettingsUtils.setBool(_skFacebookLogin, true);
  }

  static Future<bool> isLoggedIn() async {
    return await SettingsUtils.getBool(_skLogin);
  }

  static setLoggedIn(bool status) async {
    return await SettingsUtils.setBool(_skLogin, status);
  }

  static Future<bool> isGuest() async {
    return await SettingsUtils.getBool(_skGuest);
  }

  static setGuest(bool status) async {
    return await SettingsUtils.setBool(_skGuest, status);
  }

  static Future<String> getAppToken() async {
    return await SettingsUtils.getString(_skMobileToken);
  }

  static Future<bool> setMobileToken(String token) async {
    setLoggedIn(true);
    await SettingsUtils.set(_skMobileToken, token);
    return true;
  }

  static Future<bool> removeSession() async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.remove(_skMobileToken);
    // prefs.remove(_skLogin);
    // prefs.remove(_skUserName);
    // prefs.remove(_skUserImage);
    // prefs.remove(_skUserId);
    // // prefs.remove(_skFCMToken);
    // prefs.remove(_skUserEmail);
    // prefs.remove(_skUserPhone);
    await SettingsUtils.remove(_skMobileToken);
    await SettingsUtils.remove(_skLogin);
    return true;
  }

  static Future<Null> setFCMToken(String? token) async {
    await SettingsUtils.set(_skFCMToken, token ?? '');
  }

  static Future<String> getFCMToken() async {
    return await SettingsUtils.getString(_skFCMToken);
  }

  static Future<void> setUserId(String id) async {
    await SettingsUtils.set(_skUserId, id);
  }

  static Future<String> getUserId() async {
    return await SettingsUtils.getString(_skUserId);
  }

  // static Future<void> setUserData(User user) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString(_skUserId,
  //       "%%1" + CryptographyHelper().encryptWord(user.id.toString()));
  //   prefs.setString(_skUserName,
  //       "%%1" + CryptographyHelper().encryptWord(user.namaLengkap.toString()));
  //   prefs.setString(_skUserEmail,
  //       "%%1" + CryptographyHelper().encryptWord(user.email.toString()));
  //   prefs.setString(_skUserPhone,
  //       "%%1" + CryptographyHelper().encryptWord(user.noWa.toString()));
  // }

  // static Future<User?> getUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? id = prefs.getString(_skUserId);
  //   String? name = prefs.getString(_skUserName);
  //   String? email = prefs.getString(_skUserEmail);
  //   String? phone = prefs.getString(_skUserPhone);

  //   if (id != null && name != null && email != null && phone != null) {
  //     if (id.contains("%%1")) {
  //       id = CryptographyHelper().decryptWord(id.replaceFirst("%%1", ""));
  //     } else if (id.isNotEmpty) {
  //       prefs.setString(
  //           _skUserId, "%%1" + CryptographyHelper().encryptWord(id.toString()));
  //     }

  //     if (name.contains("%%1")) {
  //       name = CryptographyHelper().decryptWord(name.replaceFirst("%%1", ""));
  //     } else if (name.isNotEmpty) {
  //       prefs.setString(_skUserName,
  //           "%%1" + CryptographyHelper().encryptWord(name.toString()));
  //     }

  //     if (email.contains("%%1")) {
  //       email = CryptographyHelper().decryptWord(email.replaceFirst("%%1", ""));
  //     } else if (email.isNotEmpty) {
  //       prefs.setString(_skUserEmail,
  //           "%%1" + CryptographyHelper().encryptWord(email.toString()));
  //     }

  //     if (phone.contains("%%1")) {
  //       phone = CryptographyHelper().decryptWord(phone.replaceFirst("%%1", ""));
  //     } else if (phone.isNotEmpty) {
  //       prefs.setString(_skUserPhone,
  //           "%%1" + CryptographyHelper().encryptWord(phone.toString()));
  //     }

  //     return User()
  //       ..id = id
  //       ..namaLengkap = name
  //       ..email = email
  //       ..noWa = phone;
  //   } else {
  //     return null;
  //   }
  // }
}
