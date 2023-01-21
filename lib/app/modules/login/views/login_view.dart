import 'package:flutter_svg/flutter_svg.dart';
import 'package:stakedos/app/core/base_import.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: ColorStyle.whiteColor,
          width: Get.width,
          height: Get.height,
          child: ScrollConfiguration(
            behavior: CustomDisableGlowBehavior(),
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 104),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Digital",
                                  style: TypographyStyle.heading1Medium
                                      .copyWith(
                                          color: ColorStyle.secondaryColor)),
                              TextSpan(
                                  text: " Informasi",
                                  style: TypographyStyle.heading1Medium
                                      .copyWith(
                                          color: ColorStyle.primaryDarkColor))
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: "STAKE",
                                  style: TypographyStyle.heading2Medium
                                      .copyWith(
                                          color: ColorStyle.primaryDarkColor)),
                              TextSpan(
                                  text: "DOS",
                                  style: TypographyStyle.heading2Medium
                                      .copyWith(
                                          color: ColorStyle.secondaryColor))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 60, right: 60, top: 50),
                          width: Get.width * 0.8,
                          child: Focus(
                            onFocusChange: (status) {
                              controller.textFormController["nidn"]?.onFocus =
                                  status;
                              controller.update();
                            },
                            child: CustomTextField(
                              controller: controller.textFormController["nidn"],
                              hintText: "NIDN",
                              prefixIcon: TextFieldIconWidget(
                                  customWidget: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Icon(Icons.account_box_rounded),
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, bottom: 40, top: 40),
                          child: Focus(
                            onFocusChange: (status) {
                              controller.textFormController["password"]
                                  ?.onFocus = status;
                              controller.update();
                            },
                            child: CustomTextField(
                              controller:
                                  controller.textFormController["password"],
                              hintText: "Kata Sandi",
                              prefixIcon: TextFieldIconWidget(
                                  customWidget: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Icon(Icons.lock),
                              )),
                            ),
                          ),
                        ),
                        CustomButton(
                          width: Get.width * 0.72,
                          color: ColorStyle.secondaryColor,
                          onPressed: () {
                            controller.tapLogin();
                          },
                          child: Text(
                            "MASUK",
                            style: TypographyStyle.body2Medium
                                .copyWith(color: ColorStyle.whiteColor),
                            // style: textLogin2,
                          ),
                        ),
                      ],
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
