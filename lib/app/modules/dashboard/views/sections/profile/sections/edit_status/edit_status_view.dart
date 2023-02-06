import 'package:flutter_switch/flutter_switch.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/sections/edit_status/edit_status_controller.dart';

class EditStatusSectionView extends StatefulWidget {
  const EditStatusSectionView({super.key});

  @override
  State<EditStatusSectionView> createState() => _EditStatusSectionViewState();
}

class _EditStatusSectionViewState extends State<EditStatusSectionView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditStatusController>(
      init: EditStatusController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorStyle.whiteColor,
            systemOverlayStyle: SystemUiOverlayStyle(
                // Android
                statusBarColor: ColorStyle.whiteColor,
                statusBarIconBrightness: Brightness.dark,
                // iOS
                statusBarBrightness: Brightness.light,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarDividerColor: ColorStyle.lightDarkGreyColor),
            leading: AppBarBackButton(
              onGoBack: controller.onGoBack,
            ),
            title: Text(
              "Ubah Status",
              style: TypographyStyle.body2SemiBold
                  .copyWith(color: ColorStyle().grayscaleRange[900]),
              textAlign: TextAlign.center,
            ),
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            color: ColorStyle.whiteColor,
            width: Get.width,
            height: Get.height,
            child: ScrollConfiguration(
              behavior: CustomDisableGlowBehavior(),
              child: ListView(
                children: [
                  Container(
                    color: ColorStyle().grayscaleRange[200],
                    height: 2,
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Status Kehadiran",
                              style: TypographyStyle.body3Bold.copyWith(
                                  color: ColorStyle().grayscaleRange[700]),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                FlutterSwitch(
                                  activeColor: ColorStyle.secondaryColor,
                                  inactiveColor: ColorStyle.primaryColor,
                                  value: controller.isToggled,
                                  onToggle: (value) {
                                    setState(() {
                                      controller.isToggled = value;
                                      controller.toogleToString();
                                    });
                                  },
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    controller.hadir,
                                    style: TypographyStyle.body1Bold.copyWith(
                                        color:
                                            ColorStyle().grayscaleRange[700]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            CustomAutocompleteTextField<String>(
                              list: ["R301", "R302", "R303"],
                              hintText: 'Pilih Tempat',
                              itemTitle: (val) => val,
                              onSelected: (v) {
                                controller.choosenAttendPlace = v;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Catatan",
                              style: TypographyStyle.body4Medium.copyWith(
                                  color: ColorStyle().grayscaleRange[600]),
                            ),
                            SizedBox(height: 8),
                            Focus(
                              onFocusChange: (status) {
                                controller.textFormController["Catatan"]
                                    ?.onFocus = status;
                                controller.update();
                              },
                              child: CustomTextField(
                                controller:
                                    controller.textFormController["catatan"],
                                hintText: "Catatan",
                                inputFormatter: [
                                  FilteringTextInputFormatter.deny(
                                    RegExp(r'[0-9_,*()!@#$%^&`~|\\\[\]+=]'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        CustomButton(
                          isLoading: controller.isLoadingSave,
                          onPressed: controller.saveDosenData,
                          color: ColorStyle.secondaryColor,
                          radius: 100,
                          width: Get.width * 88 / 100,
                          child: Text(
                            'Simpan',
                            style: TypographyStyle.body1Bold.copyWith(
                              color: ColorStyle.whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
