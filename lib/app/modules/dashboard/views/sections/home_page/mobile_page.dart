import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/controller.dart';
import 'package:stakedos/app/modules/home/controllers/home_controller.dart';
import 'package:stakedos/app/routes/app_pages.dart';

import 'controller.dart';

class HomePageMobilePage extends StatefulWidget {
  final DashboardController rootController;
  const HomePageMobilePage({Key? key, required this.rootController})
      : super(key: key);
  @override
  _HomePageMobilePageState createState() => _HomePageMobilePageState();
}

class _HomePageMobilePageState extends State<HomePageMobilePage>
    with AutomaticKeepAliveClientMixin<HomePageMobilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<HomePageController>(
      init: HomePageController(rootController: widget.rootController),
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
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: SizedBox(
                          height: 32,
                          width: 32,
                          child: Lottie.asset('assets/animations/loader.json',
                              width: 54, height: 54, frameRate: FrameRate(60)),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              color: ColorStyle.secondaryColor,
                              height: 278,
                            ),
                            Container(
                              height: 308,
                            ),
                            Container(
                              height: 278,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  child: SvgPicture.asset(
                                    "assets/illustrations/dashboard1.svg",
                                    height: 220,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Selamat datang di",
                                      style: TypographyStyle.body3Medium
                                          .copyWith(
                                              color: ColorStyle.whiteColor),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "STAKEDOS",
                                      style: TypographyStyle.body1Bold.copyWith(
                                          color: ColorStyle.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 308,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    onTap: () => controller.tapTentang(),
                                    child: Container(
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: ColorStyle.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                              color: ColorStyle()
                                                  .grayscaleRange[200]!,
                                              width: 2)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                "assets/icons/logo_stakedos.png",
                                                height: 40,
                                              ),
                                              SizedBox(
                                                width: 32,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Tentang STAKEDOS",
                                                  style: TypographyStyle
                                                      .body1Bold
                                                      .copyWith(
                                                          color: ColorStyle()
                                                                  .grayscaleRange[
                                                              900]),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 20,
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ))
                          ]),
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Halaman',
                                  style: TypographyStyle.body1Bold.copyWith(
                                      color: ColorStyle().grayscaleRange[900]),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 8.0, top: 8, bottom: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8),
                                            // width: 161,
                                            height: 169,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: ColorStyle()
                                                        .grayscaleRange[200]!,
                                                    width: 2)),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                widget.rootController
                                                    .onGoListStatus();
                                              },
                                              child: Stack(
                                                children: [
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                        height: 85,
                                                        color: ColorStyle()
                                                                .grayscaleRange[
                                                            100],
                                                      )),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.0),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              SvgPicture.asset(
                                                            "assets/illustrations/dashboard2.svg",
                                                            height: 100,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          16),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16)),
                                                          color: ColorStyle
                                                              .whiteColor,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              height: 2,
                                                              color: ColorStyle()
                                                                      .grayscaleRange[
                                                                  200],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16,
                                                                  vertical: 12),
                                                              child: Center(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                        "Daftar Status",
                                                                        style: TypographyStyle
                                                                            .body1SemiBold
                                                                            .copyWith(color: ColorStyle().grayscaleRange[900])),
                                                                    Text(
                                                                        "Kehadiran Dosen",
                                                                        style: TypographyStyle
                                                                            .body3Medium
                                                                            .copyWith(color: ColorStyle().grayscaleRange[500])),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8),
                                            // width: 161,
                                            height: 169,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: ColorStyle()
                                                        .grayscaleRange[200]!,
                                                    width: 2)),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () {
                                                widget.rootController
                                                    .onGoProfile();
                                              },
                                              child: Stack(
                                                children: [
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                        height: 85,
                                                        color: ColorStyle()
                                                                .grayscaleRange[
                                                            100],
                                                      )),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.0),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              SvgPicture.asset(
                                                            "assets/illustrations/dashboard3.svg",
                                                            height: 100,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          16),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16)),
                                                          color: ColorStyle
                                                              .whiteColor,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              height: 2,
                                                              color: ColorStyle()
                                                                      .grayscaleRange[
                                                                  200],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16,
                                                                  vertical: 12),
                                                              child: Center(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                        "Preferensi",
                                                                        style: TypographyStyle
                                                                            .body1SemiBold
                                                                            .copyWith(color: ColorStyle().grayscaleRange[900])),
                                                                    Text(
                                                                        "Profile & Tentang",
                                                                        style: TypographyStyle
                                                                            .body3Medium
                                                                            .copyWith(color: ColorStyle().grayscaleRange[500])),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
