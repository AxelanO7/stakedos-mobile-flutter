import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:stakedos/app/core/base_import.dart';
// import 'package:stakedos/app/pages/get_started/avatar/pick/sections/choose_avatar_prebuilt_section.dart';

class EditStatusController extends BaseController {
  bool isLoadingSave = false;
  PageController pageController = PageController();
  String hadir = '';
  bool statushadir = false;
  String dropdownValue = 'Ruang Dosen';
  String editKey = "";
  String choosenAttendPlace = "";
  bool isToggled = false;
  // String schoolCategory = "";

  // int avatarImageView = 1;
  // bool isUploadingNewPhoto = false;

  Map<String, TextFieldController> textFormController = {
    "tempat": TextFieldController(
        controller: TextEditingController(), onFocus: false),
    "catatan": TextFieldController(
        controller: TextEditingController(), onFocus: false),
  };

  @override
  onInit() {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  onReady() async {
    //  avatarImageView = int.tryParse(await SettingsUtils.getString(
    //         "student_${targetCategory}_avatar_id")) ??
    //     1;
    await getDosenData();
    isLoading = false;
    update();
    super.onReady();
  }

  getDosenData() async {
    //TODO: sesuaikan setelah halaman login terimplementasi
    String userId = await AuthUtils.getUserId();
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/dosen');
    var userAuthData = await fAuthRef.get();
    var respJson = json.encode(userAuthData.value);
    Map<String, dynamic> rawData = json.decode(respJson);
    rawData.forEach(
      (key, value) async {
        StatusKehadiranData userData = StatusKehadiranData.fromJson(value);
        if (userData.id.toString() == userId) {
          editKey = key;
          print(editKey);
          textFormController["catatan"]?.controller?.text =
              userData.catatan.toString();
          update();
        }
      },
    );
  }

  toogleToString() {
    if (isToggled == true) {
      hadir = "Hadir";
    } else {
      hadir = "Tidak Hadir";
    }
  }

  saveDosenData() async {
    isLoadingSave = true;
    update();
    //TODO: sesuaikan setelah halaman login terimplementasi
    String userId = await AuthUtils.getUserId();
    // String userId = "4";
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/dosen/$editKey');
    var payload = {
      "catatan": textFormController["catatan"]?.controller?.text,
      "kehadiran_tempat": choosenAttendPlace,
      "status_kehadiran": hadir
    };
    await fAuthRef.update(payload);
    print("sukses ubah status");

    isLoadingSave = false;
    update();
  }

  @override
  onClose() async {
    super.onClose();
  }

  Future<bool> onWillPop() async {
    return true;
  }

  void onGoBack() {
    return Get.back();
  }

  void tapKehadiran(Object? value) {
    hadir = value.toString();
    update();
  }
}
