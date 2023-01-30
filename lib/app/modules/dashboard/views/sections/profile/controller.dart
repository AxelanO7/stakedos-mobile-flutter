import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class ProfileController extends BaseController {
  var mainScrollController = ScrollController();
  EasyRefreshController refreshController = EasyRefreshController();

  StatusKehadiranData? profileData;

  ProfileController();
  @override
  onInit() {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  onReady() async {
    await getDosenData();
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  void tapTentang() {
    Get.toNamed(Routes.TENTANG);
  }

  void tapEdit() {
    Get.toNamed(Routes.EDIT);
  }

  void tapAdd() {
    Get.toNamed(Routes.ADD);
  }

  onGoBackProfile() {
    return Get.back();
  }

  @override
  listData({int? pageTo}) async {
    getDosenData();
  }

  getDosenData() async {
    //TODO: sesuaikan setelah halaman login terimplementasi
    // String userId = await AuthUtils.getUserId();
    String userId = "4";
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/dosen');
    var userAuthData = await fAuthRef.get();
    var respJson = json.encode(userAuthData.value);
    Map<String, dynamic> rawData = json.decode(respJson);
    rawData.forEach((key, value) async {
      StatusKehadiranData userData = StatusKehadiranData.fromJson(value);
      if (userData.id.toString() == userId) {
        profileData = userData;
        update();
      }
    });
  }

  void tapLogout() {
    AuthUtils.doLogout();
    Get.offAllNamed(Routes.SELECT_ROLE);
  }
}
