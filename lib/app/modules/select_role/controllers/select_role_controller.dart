import 'package:get/get.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class SelectRoleController extends GetxController {
  //TODO: Implement SelectRoleController

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

  void increment() => count.value++;

  void tapDosen() {
    Get.toNamed(Routes.LOGIN);
  }
}
