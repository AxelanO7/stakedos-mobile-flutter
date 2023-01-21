import 'package:stakedos/app/core/base_import.dart';

class CustomCardContent extends StatelessWidget {
  final List<Widget> title;
  final Widget child;
  final double? fixedHeight;
  final double? fixedWidth;
  final EdgeInsets? childPadding;
  final EdgeInsets? tittlePadding;
  final MainAxisAlignment? titleMainAxisAlignment;
  final Color? headerColor;
  final Color? bottomBorderColor;

  const CustomCardContent(
      {Key? key,
      required this.title,
      required this.child,
      this.fixedHeight,
      this.fixedWidth,
      this.childPadding,
      this.headerColor,
      this.bottomBorderColor,
      this.tittlePadding,
      this.titleMainAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: fixedWidth ?? Get.width,
          decoration: BoxDecoration(
            color: headerColor ?? ColorStyle().redRange[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: tittlePadding ??
                EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment:
                  titleMainAxisAlignment ?? MainAxisAlignment.spaceBetween,
              children: title,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              height: 10,
              width: fixedWidth ?? Get.width,
              decoration: BoxDecoration(
                color: headerColor ?? ColorStyle().redRange[400],
                border: Border.all(
                  width: 0,
                  color: headerColor ?? ColorStyle().redRange[400]!,
                ),
              ),
            ),
            Container(
              height: fixedHeight ?? null,
              width: fixedWidth ?? Get.width,
              padding: childPadding ?? EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorStyle.whiteColor,
                border: Border.all(
                  width: 2,
                  color: bottomBorderColor ?? ColorStyle().grayscaleRange[200]!,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: child,
            ),
          ],
        ),
      ],
    );
  }
}
