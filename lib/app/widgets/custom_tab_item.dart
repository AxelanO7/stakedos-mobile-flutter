import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter/material.dart';

class CustomTabItem extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final bool active;
  final Color? customActiveColor;
  final Color? customTextDisabledColor;
  final bool lastPage;
  final EdgeInsetsGeometry? itemPadding;
  final Radius? borderRadius;
  CustomTabItem(
      {this.onTap,
      this.title,
      this.customTextDisabledColor,
      this.lastPage: false,
      this.active: false,
      this.customActiveColor,
      this.itemPadding,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 41,
          padding: itemPadding ?? EdgeInsets.only(left: 35, right: 35),
          decoration: BoxDecoration(
            color: active
                ? customActiveColor ?? ColorStyle().redRange[400]
                : Colors.transparent,
            borderRadius: BorderRadius.all(
              borderRadius ?? Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? '-',
                style: TypographyStyle.body1Reguler.copyWith(
                  color: active
                      ? ColorStyle.whiteColor
                      : ColorStyle().redRange[400],
                ),
              ),
            ],
          ),
        ),
      ),
      active
          ? Container()
          : lastPage
              ? Container()
              : Container(
                  color: ColorStyle().redRange[100],
                  height: 20,
                  width: 1,
                ),
    ]);
  }
}
