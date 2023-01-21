import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter_svg/svg.dart';

class ContentProperties {
  final String title, content;
  final String? imagePath, leftButtonCaption, rightButtonCaption;
  const ContentProperties(
      {this.title = "Alert",
      this.content = "Operation Success",
      this.imagePath,
      this.leftButtonCaption,
      this.rightButtonCaption});
}

class ContentAction {
  final Function()? leftButtonAction, rightButtonAction;
  const ContentAction({this.leftButtonAction, this.rightButtonAction});
}

class AlertBottomSheet extends StatelessWidget {
  final ContentProperties contentData;
  final ContentAction? contentAction;
  AlertBottomSheet(
      {this.contentData = const ContentProperties(
        title: "Alert",
        content: "Operation Success",
      ),
      this.contentAction});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                if (contentData.imagePath != null)
                  Column(
                    children: [
                      SvgPicture.asset(
                        contentData.imagePath!,
                        height: 180,
                        width: 180,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          contentData.title,
                          style: TypographyStyle.heading4Bold
                              .copyWith(color: ColorStyle().redRange[400]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                contentData.content,
                style: TypographyStyle.body2Medium
                    .copyWith(color: ColorStyle().grayscaleRange[500]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            contentAction?.rightButtonAction != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: contentAction?.leftButtonAction ??
                              () {
                                Get.back(closeOverlays: true);
                              },
                          color: ColorStyle.whiteColor,
                          radius: 100,
                          width: (Get.width * 43.5) / 100,
                          child: Text(
                            contentData.leftButtonCaption ?? "Cancel",
                            style: TypographyStyle.body1Reguler.copyWith(
                              color: ColorStyle().grayscaleRange[500],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: CustomButton(
                        onPressed: contentAction!.rightButtonAction!,
                        color: ColorStyle.secondaryColor,
                        width: (Get.width * 43.5) / 100,
                        radius: 100,
                        child: Text(
                          contentData.rightButtonCaption ?? "OK",
                          style: TypographyStyle.body1Reguler.copyWith(
                            color: ColorStyle.whiteColor,
                          ),
                        ),
                      ))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: contentAction?.leftButtonAction ??
                              () {
                                Get.back(closeOverlays: true);
                              },
                          color: ColorStyle.secondaryColor,
                          width: Get.width * 91.5 / 100,
                          radius: 100,
                          child: Text(
                            contentData.leftButtonCaption ?? "OK",
                            style: TypographyStyle.body1Reguler.copyWith(
                              color: ColorStyle.whiteColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
