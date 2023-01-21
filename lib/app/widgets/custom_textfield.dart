import 'package:stakedos/app/styles/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  final Color? cursorColor;
  final Color? fillColor;
  final Color? activeBorderColor;
  final Color? inactiveBorderColor;
  final Color? disableBorderColor;
  final double? borderRadius;
  final TextFieldController? controller;
  final TextFieldIconWidget? suffixIcon;
  final TextFieldIconWidget? prefixIcon;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatter;
  final String? hintText;
  final String? smallHintText;
  final String? errorText;
  final bool obscureText;
  final String obscureCharacter;
  final bool isSmall;
  final Function(String)? onChange;
  final bool? enabled;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  CustomTextField(
      {Key? key,
      this.cursorColor,
      this.fillColor,
      this.activeBorderColor,
      this.inactiveBorderColor,
      this.disableBorderColor,
      this.borderRadius,
      this.suffixIcon,
      this.prefixIcon,
      this.textStyle,
      this.inputFormatter,
      this.hintText,
      this.smallHintText,
      this.errorText,
      this.controller,
      this.obscureCharacter = '•',
      this.obscureText = false,
      this.isSmall = false,
      this.onChange,
      this.enabled,
      this.keyboardType,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obscureText,
          obscuringCharacter: obscureCharacter,
          autofocus: false,
          focusNode: focusNode ?? null,
          controller: controller?.controller,
          onChanged: onChange ?? null,
          inputFormatters: inputFormatter ?? null,
          keyboardType: keyboardType ?? null,
          style: TypographyStyle.body1Bold.copyWith(
              fontSize: 16,
              color: ColorStyle().grayscaleRange[700]), //font style
          cursorColor: ColorStyle().grayscaleRange[700], //cursor color
          enabled: enabled ?? true, //set disable or false
          decoration: InputDecoration(
            fillColor: !(enabled ?? true)
                ? ColorStyle().grayscaleRange[100]
                : fillColor ?? null, //fill color
            suffixIcon: suffixIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      suffixIcon?.customWidget ??
                          Padding(
                            padding: suffixIcon?.padding ??
                                const EdgeInsets.fromLTRB(12, 12, 0, 14),
                            child: suffixIcon?.SvgAssetsPath != null
                                ? SvgPicture.asset(
                                    suffixIcon!.SvgAssetsPath!,
                                    height: suffixIcon?.customSize?.height,
                                    width: suffixIcon?.customSize?.width,
                                    color: suffixIcon?.customIconColor ??
                                        (ColorStyle().grayscaleRange[400]!),
                                  )
                                : Image.asset(
                                    suffixIcon!.ImageAssetsPath!,
                                    height: suffixIcon?.customSize?.height,
                                    width: suffixIcon?.customSize?.width,
                                    color: suffixIcon?.customIconColor ??
                                        (ColorStyle().grayscaleRange[400]!),
                                  ),
                          ),
                    ],
                  )
                : null,
            prefixIcon: prefixIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      prefixIcon?.customWidget ??
                          Padding(
                            padding: prefixIcon?.padding ??
                                const EdgeInsets.fromLTRB(12, 12, 0, 14),
                            child: prefixIcon?.SvgAssetsPath != null
                                ? SvgPicture.asset(
                                    prefixIcon!.SvgAssetsPath!,
                                    height: prefixIcon?.customSize?.height,
                                    width: prefixIcon?.customSize?.width,
                                    color: prefixIcon?.customIconColor ??
                                        (ColorStyle().grayscaleRange[400]!),
                                  )
                                : Image.asset(
                                    prefixIcon!.ImageAssetsPath!,
                                    height: prefixIcon?.customSize?.height,
                                    width: prefixIcon?.customSize?.width,
                                    color: prefixIcon?.customIconColor ??
                                        (ColorStyle().grayscaleRange[400]!),
                                  ),
                          ),
                    ],
                  )
                : null,
            filled: !(enabled ?? true)
                ? true
                : fillColor != null
                    ? true
                    : false, //set red color
            hintText: hintText ?? 'Placeholder Text...', //hint
            hintStyle: TypographyStyle.body1Bold.copyWith(
                color: ColorStyle().grayscaleRange[400],
                fontSize: 15), //hint style
            contentPadding: EdgeInsets.only(left: 16, right: 0, top: 16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
              borderSide: BorderSide(
                color: errorText != null
                    ? ColorStyle().redRange[400]!
                    : ColorStyle().blueRange[300]!, //border active color
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
              borderSide: BorderSide(
                color: ColorStyle().grayscaleRange[200]!, //border enable color
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
              borderSide: BorderSide(
                color: ColorStyle().grayscaleRange[200]!, //border enable color
                width: 2,
              ),
            ),
          ),
        ),
        smallHintText != null && smallHintText != ''
            ? errorText == null || errorText == ''
                ? Padding(
                    padding: EdgeInsets.only(
                      top: 4.0,
                    ),
                    child: Text(smallHintText ?? '',
                        style: TypographyStyle.body3Medium
                            .copyWith(color: ColorStyle().grayscaleRange[400])))
                : Container()
            : Container(),
        errorText != null && errorText!.length > 0
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/warning.svg",
                        height: 16,
                        width: 16,
                        color: ColorStyle().redRange[400]),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      errorText ?? '',
                      style: TypographyStyle.body3Medium
                          .copyWith(color: ColorStyle().redRange[400]),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

class TextFieldIconWidget {
  final Widget? customWidget;
  final String? SvgAssetsPath;
  final String? ImageAssetsPath;
  final EdgeInsetsGeometry? padding;
  final Color? customIconColor;
  final Size? customSize;

  const TextFieldIconWidget({
    this.customIconColor,
    this.customWidget,
    this.SvgAssetsPath,
    this.ImageAssetsPath,
    this.customSize,
    this.padding,
  }) : assert(
            !(customWidget != null &&
                (SvgAssetsPath != null || ImageAssetsPath != null)),
            'Cannot use other property after declaring customWidget.');
}

class TextFieldController {
  final TextEditingController? controller;
  String? errorMessage;
  bool onFocus;
  bool isObscure;
  bool isNumberOnly;

  TextFieldController({
    this.controller,
    this.errorMessage,
    this.onFocus = false,
    this.isObscure = false,
    this.isNumberOnly = false,
  });
}
