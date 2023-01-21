import 'package:stakedos/app/core/base_import.dart';

class CustomBorderContent extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? width;

  const CustomBorderContent(
      {Key? key,
      required this.child,
      this.padding,
      this.borderColor,
      this.margin,
      this.backgroundColor,
      this.borderRadius,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: margin ?? null,
      width: width ?? null,
      decoration: BoxDecoration(
        color: backgroundColor ?? null,
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        border: Border.all(
          width: 2,
          color: borderColor ?? ColorStyle().grayscaleRange[200]!,
        ),
      ),
      child: child,
    );
  }
}
