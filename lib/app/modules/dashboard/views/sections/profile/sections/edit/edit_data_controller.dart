import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:stakedos/app/core/base_import.dart';
// import 'package:stakedos/app/pages/get_started/avatar/pick/sections/choose_avatar_prebuilt_section.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class EditDataController extends BaseController {
  bool isLoadingSave = false;
  PageController pageController = PageController();
  String hadir = '';
  bool statushadir = false;
  String dropdownValue = 'Ruang Dosen';
  String editKey = "";
  String choosenAttendPlace = "";
  // String schoolCategory = "";

  // int avatarImageView = 1;
  // bool isUploadingNewPhoto = false;

  Map<String, TextFieldController> textFormController = {
    "name": TextFieldController(
        controller: TextEditingController(), onFocus: false),
    "nidn": TextFieldController(
        controller: TextEditingController(),
        onFocus: false,
        isNumberOnly: true),
    "phone": TextFieldController(
        controller: TextEditingController(),
        onFocus: false,
        isNumberOnly: true),
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
        editKey = key;
        print(editKey);
        textFormController["name"]?.controller?.text =
            userData.namaDosen.toString();
        textFormController["nidn"]?.controller?.text = userData.nidn.toString();
        textFormController["phone"]?.controller?.text =
            userData.noTelepon.toString();
        textFormController["catatan"]?.controller?.text =
            userData.catatan.toString();
        update();
      }
    });
  }

  saveDosenData() async {
    isLoadingSave =true;
    update();
    //TODO: sesuaikan setelah halaman login terimplementasi
    // String userId = await AuthUtils.getUserId();
    String userId = "4";
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/dosen/$editKey');
    var payload = {
      "catatan": textFormController["catatan"]?.controller?.text,
      "kehadiran_tempat": choosenAttendPlace,
      "nama_dosen": textFormController["name"]?.controller?.text,
      "nidn": textFormController["nidn"]?.controller?.text,
      "no_telepon": textFormController["phone"]?.controller?.text,
      "status_kehadiran": hadir
    };
    await fAuthRef.update(payload);
    print("sukses simpan data");

    isLoadingSave =false;
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
//   onTapImage() async {}
// }
