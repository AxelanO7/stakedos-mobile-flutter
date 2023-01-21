import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/profile/controller.dart';

class AboutSectionView extends StatelessWidget {
  const AboutSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
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
              onGoBack: controller.onGoBackProfile,
            ),
            title: Text(
              "Tentang STAKEDOS",
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2,
                      color: ColorStyle().grayscaleRange[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "STAKEDOS",
                        style: TypographyStyle.heading3Medium,
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        "Status Kehadiran Dosen (STAKEDOS) adalah\nsebuah aplikasi mobile penyedia informasi kehadiran dosen dilingkungan kampus INSTIKI. yang dibuat untuk membantu aktivitas dikampus.",
                        style: TypographyStyle.body4Medium
                            .copyWith(color: ColorStyle().grayscaleRange[700]),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        "Dalam hal menerima dan memberikan informasi, aplikasi ini ditujukan kepada civitas akademika INSTIKI dan mahasiswa dengan harapan dapat menjadi program yang bermanfaat",
                        style: TypographyStyle.body4Medium
                            .copyWith(color: ColorStyle().grayscaleRange[700]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
