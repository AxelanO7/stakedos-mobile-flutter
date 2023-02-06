import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/controller.dart';
// import 'package:stakedos/app/pages/get_started/avatar/pick/sections/choose_avatar_prebuilt_section.dart';

class AddDataController extends BaseController {
  List<StatusKehadiranData?> dosenList = [];
  PageController pageController = PageController();
  String hadir = "Tidak Hadir";
  String tempatHadir = "Ruangan Dosen";

  // String urlPost =
  //     'https://stakedos-23d7b-default-rtdb.asia-southeast1.firebasedatabase.app/testList/data.json';
  // String testPost =
  //     'https://stakedos-23d7b-default-rtdb.asia-southeast1.firebasedatabase.app/test/data.json';
  // String dropdownValue = 'Ruang Dosen';
  // String schoolCategory = "";

  // int avatarImageView = 1;
  // bool isUploadingNewPhoto = false;

  Map<String, TextFieldController> textFormController = {
    "nama": TextFieldController(
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
    "username": TextFieldController(
        controller: TextEditingController(), onFocus: false),
    "tipe": TextFieldController(
        controller: TextEditingController(), onFocus: false),
    // "token": TextFieldController(
    //     controller: TextEditingController(), onFocus: false),
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
    isLoading = false;
    update();
    super.onReady();
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

  onTapImage() async {}

  // postDosenListData() async {
  //   var result = await PostStatusKehadiranApi().request();
  //   if (result.statusCode == 200) {}
  //   update();
  // }

  Future postData(
      // String tipeAkun,
      // String token,
      // String password,
      String namaDosen,
      String nidn,
      String noTelepon,
      String statusKehadiran,
      String kehadiranTempat,
      String catatan) async {
    int parseNidn = int.parse(nidn);
    try {
      // final response = await post(
      //   Uri.parse(urlPost),
      //   body: jsonEncode(

      var payload = {
        "catatan": catatan,
        "id": parseNidn,
        "kehadiran_tempat": kehadiranTempat,
        "nama_dosen": namaDosen,
        "nidn": parseNidn,
        "no_telepon": noTelepon,
        "status_kehadiran": statusKehadiran,
        // "password": password,
        // "tipe_akun": tipeAkun,
        // "token": token,
      };
      FirebaseDatabase fDB = FirebaseDatabase.instance;
      DatabaseReference? fAuthRef =
          fDB.ref('/stakedos/dosen/dosen_${DeviceUtils.getRandomString(8)}');
      await fAuthRef.set(payload);
      print("sukses simpan data dosen");
      //   ),
      // );
      // print(response.body);
      // print(response.statusCode);
      // if (response.statusCode == 200) {
      return true;
      // } else {
      //   return false;
      // }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future postDataUser(
    String tipeAkun,
    String token,
    String username,
    String password,
    String nidn,
    // String namaDosen,
    // String noTelepon,
    // String statusKehadiran,
    // String kehadiranTempat,
    // String catatan
  ) async {
    int parseNidn = int.parse(nidn);
    try {
      // final response = await post(
      //   Uri.parse(urlPost),
      //   body: jsonEncode(

      var payload = {
        // "catatan": catatan,
        // "id": parseNidn,
        // "kehadiran_tempat": kehadiranTempat,
        // "nama_dosen": namaDosen,
        // "nidn": parseNidn,
        // "no_telepon": noTelepon,
        // "status_kehadiran": statusKehadiran,
        "id": parseNidn,
        "password": password,
        "tipe_akun": tipeAkun,
        "token": token,
        "username": username,
      };
      FirebaseDatabase fDB = FirebaseDatabase.instance;
      DatabaseReference? fAuthRef =
          fDB.ref('/stakedos/user/user_${DeviceUtils.getRandomString(8)}');
      await fAuthRef.set(payload);
      print("sukses simpan data user");
      //   ),
      // );
      // print(response.body);
      // print(response.statusCode);
      // if (response.statusCode == 200) {
      return true;
      // } else {
      //   return false;
      // }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
