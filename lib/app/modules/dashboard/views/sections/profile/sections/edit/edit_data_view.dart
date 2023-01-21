import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/controller.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/sections/edit/edit_data_controller.dart';

class EditDataSectionView extends StatelessWidget {
  const EditDataSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditDataController>(
      init: EditDataController(),
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
              "Edit Profil",
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
                        Text(
                          "Informasi Data Pribadi",
                          style: TypographyStyle.body3Bold.copyWith(
                              color: ColorStyle().grayscaleRange[700]),
                        ),
                        SizedBox(height: 16),
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Lengkap",
                                  style: TypographyStyle.body4Medium.copyWith(
                                      color: ColorStyle().grayscaleRange[600]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Focus(
                                    onFocusChange: (status) {
                                      controller.textFormController["full_name"]
                                          ?.onFocus = status;
                                      controller.update();
                                    },
                                    child: CustomTextField(
                                      controller: controller
                                          .textFormController["full_name"],
                                      hintText: "Nama Lengkap",
                                      inputFormatter: [
                                        FilteringTextInputFormatter.deny(RegExp(
                                            r'[0-9_,*()!@#$%^&`~|\\\[\]+=]')),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NIDN",
                                  style: TypographyStyle.body4Medium.copyWith(
                                      color: ColorStyle().grayscaleRange[600]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Focus(
                                    onFocusChange: (status) {
                                      controller.textFormController["nidn"]
                                          ?.onFocus = status;
                                      controller.update();
                                    },
                                    child: CustomTextField(
                                      controller:
                                          controller.textFormController["nidn"],
                                      hintText: "NIDN",
                                      inputFormatter: [
                                        FilteringTextInputFormatter.deny(RegExp(
                                            r'[0-9_,*()!@#$%^&`~|\\\[\]+=]')),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No Telepon",
                                  style: TypographyStyle.body4Medium.copyWith(
                                      color: ColorStyle().grayscaleRange[600]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Focus(
                                    onFocusChange: (status) {
                                      controller.textFormController["phone"]
                                          ?.onFocus = status;
                                      controller.update();
                                    },
                                    child: CustomTextField(
                                      controller: controller
                                          .textFormController["phone"],
                                      hintText: "No Telepon",
                                      inputFormatter: [
                                        FilteringTextInputFormatter.deny(RegExp(
                                            r'[0-9_,*()!@#$%^&`~|\\\[\]+=]')),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Status Kehadiran",
                              style: TypographyStyle.body3Bold.copyWith(
                                  color: ColorStyle().grayscaleRange[700]),
                            ),
                            Row(
                              children: [
                                Radio(
                                    activeColor: ColorStyle.secondaryColor,
                                    value: true,
                                    groupValue: 'kehadiran',
                                    onChanged: (value) {
                                      controller.tapKehadiran;
                                    }),
                                Text(
                                  "Hadir",
                                  style: TypographyStyle.body4Medium,
                                ),
                                Radio(
                                    activeColor: ColorStyle.secondaryColor,
                                    value: false,
                                    groupValue: 'kehadiran',
                                    onChanged: (value) {
                                      controller.tapKehadiran;
                                    }),
                                Text(
                                  "Tidak Aktif",
                                  style: TypographyStyle.body4Medium,
                                )
                              ],
                            ),
                            CustomAutocompleteTextField<String>(
                              list: ["R301", "R302", "R303"],
                              hintText: 'Pilih Tempat',
                              itemTitle: (val) => val,
                              onSelected: (v) {},
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Catatan",
                              style: TypographyStyle.body4Medium.copyWith(
                                  color: ColorStyle().grayscaleRange[600]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
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
                        SizedBox(
                          height: 32,
                        ),
                        CustomButton(
                          isLoading: false,
                          onPressed: () {},
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
                        SizedBox(
                          height: 32,
                        ),
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
