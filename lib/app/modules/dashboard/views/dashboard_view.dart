import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/mobile_page.dart';

import 'sections/list_status/mobile_page.dart';
import 'sections/home_page/mobile_page.dart';
import 'sections/profile/mobile_page.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => WillPopScope(
        onWillPop: controller.onWillPop,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorStyle.whiteColor,
            body: PageView(
              scrollDirection: Axis.vertical,
              controller: DashboardController.pageController,
              scrollBehavior: CustomDisableGlowBehavior(),
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListStatusMobilePage(
                  rootController: controller,
                ),
                HomePageMobilePage(rootController: controller),
                ProfileMobilePage(),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 65,
                width: 65,
                child: FloatingActionButton(
                  onPressed: controller.tapHome,
                  backgroundColor: DashboardController.indexTab == 1
                      ? ColorStyle.secondaryColor
                      : ColorStyle.primaryDarkColor,
                  tooltip: 'Home',
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                    ),
                  ),
                  elevation: 0,
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: FABBottomAppBar(
                height: 60,
                onFabTapped: false,
                color: Colors.black,
                currentIndex: DashboardController.indexTab > 1
                    ? DashboardController.indexTab - 1
                    : DashboardController.indexTab,
                selectedColor: DashboardController.indexTab == 1
                    ? ColorStyle.primaryDarkColor
                    : ColorStyle.secondaryColor,
                onTabSelected: controller.tapTab,
                items: [
                  FABBottomAppBarItem(
                      iconData: 'assets/icons/list.svg', text: 'Status'),
                  FABBottomAppBarItem(
                      iconData: 'assets/icons/profile.svg', text: 'Preferensi'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
