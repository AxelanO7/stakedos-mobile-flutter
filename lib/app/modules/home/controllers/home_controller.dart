import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  void tapStart() {
    Get.toNamed(Routes.SELECT_ROLE);
  }

  void increment() => count.value++;
}
