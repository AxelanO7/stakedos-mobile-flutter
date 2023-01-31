import 'package:get/get.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/list_status/detail/detail.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/sections/add/add_data_view.dart';
import 'package:stakedos/app/providers/list_dosen.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/views/sections/profile/sections/about_view.dart';
import '../modules/dashboard/views/sections/profile/sections/edit/edit_data_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/select_role/bindings/select_role_binding.dart';
import '../modules/select_role/views/select_role_view.dart';
import '../modules/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.SELECT_ROLE,
      page: () => const SelectRoleView(),
      binding: SelectRoleBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.TENTANG,
      page: () => const AboutSectionView(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => const EditDataSectionView(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => AddDataSectionView(),
    ),
    // GetPage(
    //   name: _Paths.DETAIL,
    //   page: () => DetailPage(),
    // ),
  ];
}
