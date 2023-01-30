import 'package:stakedos/app/core/base_import.dart';

import '../controllers/select_role_controller.dart';

class SelectRoleView extends GetView<SelectRoleController> {
  const SelectRoleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        color: ColorStyle.primaryLightColor,
        width: Get.width,
        height: Get.height,
        child: ScrollConfiguration(
          behavior: CustomDisableGlowBehavior(),
          child: ListView(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Digital",
                      style: TypographyStyle.heading1Medium
                          .copyWith(color: ColorStyle.secondaryColor)),
                  TextSpan(
                      text: " Informasi",
                      style: TypographyStyle.heading1Medium
                          .copyWith(color: ColorStyle.primaryDarkColor))
                ])),
              ),
            ),
            Center(
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "STAKE",
                    style: TypographyStyle.heading2Medium
                        .copyWith(color: ColorStyle.primaryDarkColor)),
                TextSpan(
                    text: "DOS",
                    style: TypographyStyle.heading2Medium
                        .copyWith(color: ColorStyle.secondaryColor))
              ])),
            ),
            Center(
              child: Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: Text(
                    "Pilih Statusmu",
                    style: TypographyStyle.body1Medium
                        .copyWith(color: ColorStyle.secondaryColor),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: CustomButton(
                  onPressed: () {
                    controller.tapDosen();
                  },
                  color: ColorStyle.whiteColor,
                  child: Text(
                    "Dosen",
                    style: TypographyStyle.body2Medium,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Center(
                child: CustomButton(
                  onPressed: () {
                    controller.tapMahasiswa();
                  },
                  color: ColorStyle.secondaryColor,
                  child: Text(
                    "Mahasiswa",
                    style: TypographyStyle.body2Medium
                        .copyWith(color: ColorStyle.whiteColor),
                  ),
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
