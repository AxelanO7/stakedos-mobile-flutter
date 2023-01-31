import 'package:flutter_svg/flutter_svg.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'controller.dart';

class ProfileMobilePage extends StatefulWidget {
  const ProfileMobilePage({Key? key}) : super(key: key);
  @override
  _ProfileMobilePageState createState() => _ProfileMobilePageState();
}

class _ProfileMobilePageState extends State<ProfileMobilePage>
    with AutomaticKeepAliveClientMixin<ProfileMobilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Stack(
        children: [
          EasyRefresh(
            header: MaterialHeader(
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorStyle.secondaryColor)),
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            child: ListView.builder(
              controller: controller.mainScrollController,
              physics: ClampingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return (controller.isLoading)
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            width: Get.width,
                            height: 48,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Preferensi",
                                style: TypographyStyle.body2SemiBold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            width: Get.width,
                            height: 36,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Preferensi",
                                style: TypographyStyle.body2SemiBold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              thickness: 2,
                              color: ColorStyle().grayscaleRange[200],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 64,
                                  width: 64,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: ScalableImageWidget.fromSISource(
                                      si: ScalableImageSource.fromSvg(
                                          rootBundle, 'assets/icons/user.svg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // "${controller.rootController.}", //2 kata pertama
                                          "Nama Dosen",
                                          style: TypographyStyle.body2Bold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[700]),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          // "${controller.rootController.studentProfile.email}", //2 kata pertama
                                          "Hadir",
                                          style: TypographyStyle.body4Medium
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[500]),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: CustomButton(
                                    height: 42,
                                    width: 46,
                                    color: ColorStyle.whiteColor,
                                    shape: BoxShape.circle,
                                    onPressed: (() {
                                      controller.tapEdit;
                                    }),
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: SvgPicture.asset(
                                        'assets/icons/edit.svg',
                                        color: ColorStyle().grayscaleRange[500],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 28, left: 16, right: 16),
                            child: CustomBorderContent(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16,
                                        bottom: 12,
                                        left: 20,
                                        right: 20),
                                    child: Text(
                                      "Detail Data",
                                      style: TypographyStyle.body1SemiBold
                                          .copyWith(
                                              color: ColorStyle.secondaryColor),
                                    ),
                                  ),
                                  Container(
                                    height: 2,
                                    color: ColorStyle.primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Nama Dosen",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        ),
                                        SizedBox(width: 42),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            " : ",
                                            style: TypographyStyle.body1SemiBold
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .grayscaleRange[600]),
                                          ),
                                        ),
                                        Text(
                                          "${controller.profileData?.namaDosen}",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          "NIDN",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        ),
                                        SizedBox(width: 99),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            " : ",
                                            style: TypographyStyle.body1SemiBold
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .grayscaleRange[600]),
                                          ),
                                        ),
                                        Text(
                                          "${controller.profileData?.nidn}",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          "No Telepon",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        ),
                                        SizedBox(width: 54),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            " : ",
                                            style: TypographyStyle.body1SemiBold
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .grayscaleRange[600]),
                                          ),
                                        ),
                                        Text(
                                          "${controller.profileData?.noTelepon}",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Status Kehadiran",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        ),
                                        SizedBox(width: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            " : ",
                                            style: TypographyStyle.body1SemiBold
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .grayscaleRange[600]),
                                          ),
                                        ),
                                        Text(
                                          "${controller.profileData?.statusKehadiran}",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Tempat Kehadiran",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            " : ",
                                            style: TypographyStyle.body1SemiBold
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .grayscaleRange[600]),
                                          ),
                                        ),
                                        Text(
                                          "${controller.profileData?.kehadiranTempat}",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 12,
                                        bottom: 16),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Catatan",
                                          style: TypographyStyle.body1SemiBold
                                              .copyWith(
                                                  color: ColorStyle()
                                                      .grayscaleRange[600]),
                                        ),
                                        SizedBox(width: 74),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            " : ",
                                            style: TypographyStyle.body1SemiBold
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .grayscaleRange[600]),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${controller.profileData?.catatan}",
                                            style: TypographyStyle.body1SemiBold
                                                .copyWith(
                                                    color: ColorStyle()
                                                        .grayscaleRange[600]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 28),
                            child: Container(
                              height: 2,
                              color: ColorStyle().grayscaleRange[200],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 24),
                            child: Text(
                              "Menu & Informasi",
                              style: TypographyStyle.body1SemiBold.copyWith(
                                  color: ColorStyle().grayscaleRange[500]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 24, right: 16),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/add.svg',
                                  color: ColorStyle().grayscaleRange[700],
                                  width: 24,
                                ),
                                InkWell(
                                  onTap: controller.tapAdd,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Tambah Status Kehadiran",
                                      style: TypographyStyle.body2SemiBold
                                          .copyWith(
                                              color: ColorStyle()
                                                  .grayscaleRange[700]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                        'assets/icons/right.svg'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 52, right: 16),
                            child: Container(
                              height: 2,
                              color: ColorStyle().grayscaleRange[700],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.tapEdit,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 32, right: 16),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/edit_status.svg',
                                    color: ColorStyle().grayscaleRange[700],
                                    width: 24,
                                  ),
                                  InkWell(
                                    onTap: controller.tapEdit,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Ubah Status Kehadiran",
                                        style: TypographyStyle.body2SemiBold
                                            .copyWith(
                                                color: ColorStyle()
                                                    .grayscaleRange[700]),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SvgPicture.asset(
                                          'assets/icons/right.svg'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 52, right: 16),
                            child: Container(
                              height: 2,
                              color: ColorStyle().grayscaleRange[700],
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.tapTentang,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 32, right: 16),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/tentang.svg',
                                    color: ColorStyle().grayscaleRange[700],
                                    width: 24,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Tentang STAKEDOS",
                                      style: TypographyStyle.body2SemiBold
                                          .copyWith(
                                              color: ColorStyle()
                                                  .grayscaleRange[700]),
                                    ),
                                  ),
                                  Expanded(
                                      child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                        'assets/icons/right.svg'),
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 52, right: 16),
                            child: Container(
                              height: 2,
                              color: ColorStyle().grayscaleRange[700],
                            ),
                          ),
                          SizedBox(
                            height: 44,
                          ),
                          Center(
                            child: CustomButton(
                              isLoading: false,
                              onPressed: () {
                                controller.tapLogout();
                              },
                              color: ColorStyle.secondaryColor,
                              radius: 100,
                              width: Get.width * 88 / 100,
                              child: Text(
                                'Log Out',
                                style: TypographyStyle.body1Bold.copyWith(
                                  color: ColorStyle.whiteColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
