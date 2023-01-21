import 'package:flutter_svg/flutter_svg.dart';
import 'package:stakedos/app/core/base_import.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: ColorStyle.primaryColor,
          width: Get.width,
          height: Get.height,
          child: ScrollConfiguration(
            behavior: CustomDisableGlowBehavior(),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Text(
                    "Selamat Datang Di Aplikasi STAKEDOS",
                    style: TypographyStyle.heading3Bold
                        .copyWith(color: ColorStyle.secondaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                SvgPicture.asset('assets/illustrations/welcome.svg'),
                Center(
                  child: CustomButton(
                    onPressed: () {
                      Get.put(HomeController()).tapStart();
                    },
                    color: ColorStyle.secondaryColor,
                    child: Text(
                      "Mulai",
                      style: TypographyStyle.body2Medium.copyWith(
                        color: ColorStyle.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
