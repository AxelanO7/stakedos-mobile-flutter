import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class HomePageController extends BaseController {
  var mainScrollController = ScrollController();
  final DashboardController rootController;

  EasyRefreshController refreshController = EasyRefreshController();

  HomePageController({required this.rootController});
  @override
  onInit() {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  onReady() async {
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

  void goToProfile() {}
}
