import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class ProfileController extends BaseController {
  var mainScrollController = ScrollController();
  EasyRefreshController refreshController = EasyRefreshController();

  bool isLoadingStatus = false;

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

  void tapEditData() {
    Get.toNamed(Routes.EDITDATA);
  }

  void tapEditStatus() {
    Get.toNamed(Routes.EDITSTATUS);
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
    //TODO: ambildata dari login
    String userId = await AuthUtils.getUserId();
    // String userId = DashboardController.nidnId;
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/dosen');
    var userAuthData = await fAuthRef.get();
    var respJson = json.encode(userAuthData.value);
    Map<String, dynamic> rawData = json.decode(respJson);
    rawData.forEach(
      (key, value) async {
        StatusKehadiranData userData = StatusKehadiranData.fromJson(value);
        // print(userData.id);
        // print(userId);
        if (userData.id.toString() == userId) {
          // print(userId);
          profileData = userData;
          isLoadingStatus = false;
          update();
        }
      },
    );
    isLoadingStatus = false;
    update();
  }

  void tapLogout() async {
    AuthUtils.doLogout();
    // LoginController.nidnId = 0;
    // DashboardController.nidnId = 0;
    Get.toNamed(Routes.SELECT_ROLE);
  }
}
