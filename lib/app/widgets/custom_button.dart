import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final Widget child;
  final bool enabled, isOutline;
  final Color color;
  final double height;
  final double width;
  final ShadowDegree shadowDegree;
  final int duration;
  final BoxShape shape;
  final bool isLoading;
  final double? radius;
  final double? horizontalPadding;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.enabled = true,
      this.color = Colors.grey,
      this.isOutline = false,
      this.isLoading = false,
      this.height = 48,
      this.shadowDegree = ShadowDegree.light,
      this.width = 260,
      this.duration = 70,
      this.shape = BoxShape.rectangle,
      this.radius,
      this.horizontalPadding})
      : assert(child != null),
        super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  static const Curve _curve = Curves.easeIn;
  static const double _shadowHeight = 4;
  double _position = 4;
  static const int _animationDuration = 150;

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - _shadowHeight;

    return AnimatedContainer(
      duration: Duration(milliseconds: _animationDuration),
      padding: widget.horizontalPadding != null
          ? EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 0)
          : null,
      child: GestureDetector(
        child: AnimatedContainer(
          duration: Duration(milliseconds: _animationDuration),
          width: widget.horizontalPadding != null
              ? widget.width - ((widget.horizontalPadding ?? 0) * 2)
              : widget.width,
          height: _height + _shadowHeight,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: _animationDuration),
                  height: _height,
                  width: widget.horizontalPadding != null
                      ? widget.width - ((widget.horizontalPadding ?? 0) * 2)
                      : widget.width,
                  decoration: BoxDecoration(
                      color: widget.enabled
                          ? darken(widget.color, widget.shadowDegree)
                          : darken(Colors.grey, widget.shadowDegree),
                      borderRadius: widget.shape != BoxShape.circle
                          ? BorderRadius.all(
                              Radius.circular(widget.radius ?? 16),
                            )
                          : null,
                      shape: widget.shape),
                ),
              ),
              AnimatedPositioned(
                curve: _curve,
                duration: Duration(milliseconds: widget.duration),
                bottom: _position,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: _animationDuration),
                  height: _height,
                  width: widget.horizontalPadding != null
                      ? widget.width - ((widget.horizontalPadding ?? 0) * 2)
                      : widget.width,
                  decoration: BoxDecoration(
                      color: widget.isOutline
                          ? ColorStyle.whiteColor
                          : widget.enabled
                              ? widget.color
                              : Colors.grey,
                      borderRadius: widget.shape != BoxShape.circle
                          ? BorderRadius.all(
                              Radius.circular(widget.radius ?? 16),
                            )
                          : null,
                      shape: widget.shape,
                      border: widget.isOutline
                          ? Border.all(color: widget.color, width: 2)
                          : widget.color == ColorStyle.whiteColor
                              ? Border.all(
                                  color: darken(ColorStyle.whiteColor,
                                      widget.shadowDegree))
                              : null),
                  child: Center(
                    child: widget.isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: widget.isOutline
                                  ? widget.color
                                  : ColorStyle.whiteColor,
                            ),
                          )
                        : widget.child,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTapDown: widget.isLoading
            ? null
            : widget.enabled
                ? _pressed
                : null,
        onTapUp: widget.isLoading
            ? null
            : widget.enabled
                ? _unPressedOnTapUp
                : null,
        onTapCancel: widget.isLoading
            ? null
            : widget.enabled
                ? _unPressed
                : null,
      ),
    );
  }

  void _pressed(_) {
    setState(() {
      _position = 0;
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _position = 4;
    });
    widget.onPressed();
  }
}

Color darken(Color color, ShadowDegree degree) {
  double amount = degree == ShadowDegree.dark ? 0.3 : 0.12;
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color opacityByDisable(Color color) {
  return color.withOpacity(.5);
}

enum ShadowDegree { light, dark }
