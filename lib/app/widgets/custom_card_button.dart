import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCardButton extends StatelessWidget {
  final String svgPath;
  final String titleCard;
  final String? descCard;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Function() onTap;

  const CustomCardButton(
      {Key? key,
      required this.svgPath,
      required this.titleCard,
      this.descCard,
      this.borderColor,
      this.borderRadius,
      this.padding,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: borderColor ?? ColorStyle().grayscaleRange[200]!,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: descCard != null
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      svgPath,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleCard,
                          style: TypographyStyle.body1Reguler.copyWith(
                            color: ColorStyle().grayscaleRange[700],
                          ),
                        ),
                        if (descCard != null)
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              descCard ?? '',
                              style: TypographyStyle.body1Reguler.copyWith(
                                color: ColorStyle().grayscaleRange[600],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/icons/basics/ic_basic_arrow_right_l.svg',
              color: ColorStyle().grayscaleRange[500],
            ),
          ],
        ),
      ),
    );
  }
}
