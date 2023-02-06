import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/observer/ui_observer.dart';
import 'package:stakedos/app/modules/login/controllers/login_controller.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  static int indexTab = 0;
  static bool onFab = false;
  static String nidnId = LoginController.nidnId;
  static PageController pageController = PageController(initialPage: 1);
  // List<Login> loginData = [];
  // Login? choosenUser;

  int nidn = 0;

  final count = 0.obs;
  @override
  void onInit() {
    onFab = true;
    indexTab = 1;
    super.onInit();
  }

  @override
  void onReady() {
    // print(nidnId);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget pageItemBuilder(context, position) {
    switch (position) {
      default:
        return Container();
    }
  }

  Future<bool> onWillPop() async {
    if (pageController.page == 0.0) {
      return true;
    } else {
      pageController.previousPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      return false;
    }
  }

  tapTab(idx) async {
    onFab = false;
    indexTab = idx >= 1 ? idx + 1 : idx;
    HomeUIObserver.themeStyle.value = indexTab == 3 ? 1 : 0;
    pageController.jumpToPage(idx >= 1 ? idx + 1 : idx);
    update();
  }

  void tapHome() {
    onFab = true;
    indexTab = 1;
    HomeUIObserver.themeStyle.value = 0;
    pageController.jumpToPage(1);
    update();
  }

  void increment() => count.value++;

  void onGoListStatus() {
    onFab = false;
    indexTab = 0;
    HomeUIObserver.themeStyle.value = indexTab == 3 ? 1 : 0;
    pageController.jumpToPage(0);
    update();
  }

  void onGoProfile() {
    onFab = false;
    indexTab = 2;
    HomeUIObserver.themeStyle.value = indexTab == 3 ? 1 : 0;
    pageController.jumpToPage(2);
    update();
  }

  tapTentang() {
    Get.toNamed(Routes.TENTANG);
  }
}
