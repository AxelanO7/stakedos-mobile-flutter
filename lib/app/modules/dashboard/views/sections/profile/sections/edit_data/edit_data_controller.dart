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
  String tempatHadir = "Ruangan Dosen";
  String dropdownValue = 'Ruang Dosen';
  String editKey = "";
  String editKeyUser = "";
  String choosenAttendPlace = "";
  String listIdSelected = "";
  // List<StatusKehadiranData?> dosenList = [];
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
    "tipe": TextFieldController(
        controller: TextEditingController(), onFocus: false),
    "username": TextFieldController(
        controller: TextEditingController(), onFocus: false),
    "password": TextFieldController(
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
    await getDosenUser();
    // print(editKey);
    // print(editKeyUser);

    isLoading = false;
    update();
    super.onReady();
  }

  getDosenData() async {
    //TODO: sesuaikan setelah halaman login terimplementasi
    String userId = await AuthUtils.getSelectId();
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
          textFormController["name"]?.controller?.text =
              userData.namaDosen.toString();
          textFormController["nidn"]?.controller?.text =
              userData.nidn.toString();
          textFormController["phone"]?.controller?.text =
              userData.noTelepon.toString();
          textFormController["catatan"]?.controller?.text =
              userData.catatan.toString();
          update();
        }
      },
    );
  }

  getDosenUser() async {
    //TODO: sesuaikan setelah halaman login terimplementasi
    String userId = await AuthUtils.getSelectId();
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/user');
    var userAuthData = await fAuthRef.get();
    var respJson = json.encode(userAuthData.value);
    Map<String, dynamic> rawData = json.decode(respJson);
    rawData.forEach(
      (key, value) async {
        UserAccount userUser = UserAccount.fromJson(value);
        if (userUser.id.toString() == userId) {
          editKeyUser = key;
          print(editKey);
          textFormController["tipe"]?.controller?.text =
              userUser.tipeAkun.toString();
          textFormController["username"]?.controller?.text =
              userUser.username.toString();
          textFormController["password"]?.controller?.text =
              userUser.password.toString();
          update();
        }
      },
    );
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

  saveDosenData() async {
    isLoadingSave = true;
    update();
    //TODO: sesuaikan setelah halaman login terimplementasi
    String userId = await AuthUtils.getSelectId();
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/dosen/$editKey');
    var payload = {
      "catatan": textFormController["catatan"]?.controller?.text,
      "kehadiran_tempat": choosenAttendPlace,
      "nama_dosen": textFormController["name"]?.controller?.text,
      "nidn": int.parse(textFormController["nidn"]?.controller?.text ?? ""),
      "no_telepon": textFormController["phone"]?.controller?.text,
      "status_kehadiran": hadir
    };
    await fAuthRef.update(payload);
    print("sukses ubah data");

    String userIdUser = await AuthUtils.getSelectId();
    FirebaseDatabase fDBUser = FirebaseDatabase.instance;
    DatabaseReference? fAuthRefUser =
        fDBUser.ref('/stakedos/user/$editKeyUser');
    var payloadUser = {
      "tipe_akun": textFormController["tipe"]?.controller?.text,
      "username": textFormController["username"]?.controller?.text,
      "password": textFormController["password"]?.controller?.text
    };
    await fAuthRefUser.update(payloadUser);
    print("sukses ubah user");

    isLoadingSave = false;
    update();
  }

  saveDosenUser() async {
    isLoadingSave = true;
    update();
    //TODO: sesuaikan setelah halaman login terimplementasi
    // String userId = "4";
    String userId = await AuthUtils.getSelectId();
    FirebaseDatabase fDB = FirebaseDatabase.instance;
    DatabaseReference? fAuthRef = fDB.ref('/stakedos/user/$editKey');
    var payload = {
      "tipe_akun": textFormController["tipe"]?.controller?.text,
      "username": textFormController["username"]?.controller?.text,
      "password": textFormController["password"]?.controller?.text
    };
    await fAuthRef.update(payload);
    print("sukses simpan data");

    isLoadingSave = false;
    update();
  }

  Future postData(String namaDosen, String nidn, String noTelepon,
      String statusKehadiran, String kehadiranTempat, String catatan) async {
    int parseNidn = int.parse(nidn);
    try {
      var payload = {
        "catatan": catatan,
        "id": parseNidn,
        "kehadiran_tempat": kehadiranTempat,
        "nama_dosen": namaDosen,
        "nidn": parseNidn,
        "no_telepon": noTelepon,
        "status_kehadiran": statusKehadiran,
      };
      FirebaseDatabase fDB = FirebaseDatabase.instance;
      DatabaseReference? fAuthRef =
          fDB.ref('/stakedos/dosen/dosen_${DeviceUtils.getRandomString(8)}');
      await fAuthRef.set(payload);
      print("sukses simpan data dosen");
      return true;
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  // Future postDataUser(
  //   String tipeAkun,
  //   String token,
  //   String username,
  //   String password,
  //   String nidn,
  // ) async {
  //   int parseNidn = int.parse(nidn);
  //   try {
  //     var payload = {
  //       "id": parseNidn,
  //       "password": password,
  //       "tipe_akun": tipeAkun,
  //       "token": token,
  //       "username": username,
  //     };
  //     FirebaseDatabase fDB = FirebaseDatabase.instance;
  //     DatabaseReference? fAuthRef =
  //         fDB.ref('/stakedos/user/user_${DeviceUtils.getRandomString(8)}');
  //     await fAuthRef.set(payload);
  //     print("sukses simpan data user");
  //     return true;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   update();
  // }
}
