import 'package:stakedos/app/routes/app_pages.dart';

import '../../../core/base_import.dart';

class LoginController extends GetxController {
  Map<String, TextFieldController> textFormController = {
    "nidn": TextFieldController(
        controller: TextEditingController(), onFocus: false),
    "password": TextFieldController(
        controller: TextEditingController(), onFocus: false, isObscure: true),
  };
  bool isLoggingIn = false;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  validateForm() {
    bool canSubmit = true;
    textFormController["nidn"]!.errorMessage = null;
    textFormController["password"]!.errorMessage = null;
    if (textFormController["nidn"]!.controller!.text.isEmpty) {
      textFormController["nidn"]!.errorMessage = 'NIDN harus diisi';
      canSubmit = false;
    }
    if (textFormController["password"]!.controller!.text.isEmpty) {
      textFormController["password"]!.errorMessage = 'Password harus diisi';
      canSubmit = false;
    }
    update();
    return canSubmit;
  }

  showLoginDefaultError() async {
    await AlertHelper.showBottomSheet(AlertBottomSheet(
      contentData: ContentProperties(
          title: "Error",
          content: "Kredensial akun tidak sesuai\nsilahkan coba lagi"),
    ));
  }

  // tapLogin() async {
  //   if (!validateForm()) {
  //     return;
  //   }
  //   // isLoggingIn = true;
  //   update();
  //   var result = await doLogin(textFormController["nidn"]!.controller!.text,
  //       textFormController["password"]!.controller!.text);
  //   if (result) {
  //     Get.offAllNamed(Routes.SELECT_ROLE);
  //     return;
  //   } else {
  //     await showLoginDefaultError();
  //   }
  //   // isLoggingIn = false;
  //   update();
  // }

  tapLogin() async {
    if (!validateForm()) {
      return;
    }
    isLoggingIn = true;
    update();
    var result = await AuthUtils.doLogin(
        textFormController["nidn"]!.controller!.text,
        textFormController["password"]!.controller!.text);
    if (result) {
      Get.offAllNamed(Routes.DASHBOARD);
      return;
    } else {
      await showLoginDefaultError();
    }
    isLoggingIn = false;
    update();
  }

  void increment() => count.value++;
}
