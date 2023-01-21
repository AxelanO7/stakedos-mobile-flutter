import 'dart:async';

import 'package:stakedos/app/core/base_import.dart';
// import 'package:stakedos/app/pages/get_started/avatar/pick/sections/choose_avatar_prebuilt_section.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class EditDataController extends BaseController {
  PageController pageController = PageController();
  String hadir = '';
  String dropdownValue = 'Ruang Dosen';
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

  void tapKehadiran(bool value) {
    value == true
        ? hadir = 'Hadir'
        : value == false
            ? hadir = 'Tidak Hadir'
            : value = value;
  }
}
//   onTapImage() async {}
// }
