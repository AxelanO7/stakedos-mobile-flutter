import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Customable and nice Switch button :).
///
/// Currently, you can change the widget
/// width but not the height property.
///
/// The following arguments are required:
///
/// * [value] determines switch state (on/off).
/// * [onChanged] is called when user toggles switch on/off.
/// * [onTap] event called on tap
/// * [onDoubleTap] event called on double tap
/// * [onSwipe] event called on swipe (left/right)
///
class CustomTargetSwitcher extends StatefulWidget {
  @required
  final bool value;
  final double width;

  @required
  final Function(bool) onChanged;
  final String textOff;
  final Color textOffColor;
  final String textOn;
  final Color textOnColor;
  final Color colorOn;
  final Color colorOff;
  final double textSize;
  final Duration animationDuration;
  final IconData iconOn;
  final IconData iconOff;
  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function()? onSwipe;

  CustomTargetSwitcher({
    this.value = false,
    this.width = 55,
    this.textOff = "Off",
    this.textOn = "On",
    this.textSize = 14.0,
    this.colorOn = Colors.green,
    this.colorOff = Colors.red,
    this.iconOff = Icons.flag,
    this.iconOn = Icons.check,
    this.animationDuration = const Duration(milliseconds: 250),
    this.textOffColor = Colors.white,
    this.textOnColor = Colors.black,
    this.onTap,
    this.onDoubleTap,
    this.onSwipe,
    required this.onChanged,
  });

  @override
  _CustomTargetSwitcherState createState() => _CustomTargetSwitcherState();
}

class _CustomTargetSwitcherState extends State<CustomTargetSwitcher>
    with SingleTickerProviderStateMixin {
  /// Late declarations
  late AnimationController animationController;
  late Animation<double> animation;
  late bool turnState;

  double value = 0.0;

  @override
  void dispose() {
    //Ensure to dispose animation controller
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;
    if (turnState) {
      value = 1;
      animationController.value = 1;
    }
    // Executes a function only one time after the layout is completed.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //Color transition animation
    Color? transitionColor = Color.lerp(widget.colorOff, widget.colorOn, value);

    return GestureDetector(
      onDoubleTap: () {
        _action();
        if (widget.onDoubleTap != null) {
          widget.onDoubleTap!();
        }
      },
      onTap: () {
        _action();
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      onPanEnd: (details) {
        _action();
        if (widget.onSwipe != null) {
          widget.onSwipe!();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1.5),
        width: widget.width,
        height: 24,
        decoration: BoxDecoration(
            color: transitionColor, borderRadius: BorderRadius.circular(50)),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-5 * value, 0)
                  : Offset(5 * value, 0), //original
              child: Opacity(
                opacity: (1 - value).clamp(0.0, 1.0),
                child: Container(
                  padding: isRTL(context)
                      ? EdgeInsets.only(left: 5)
                      : EdgeInsets.only(right: 5),
                  alignment: isRTL(context)
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  height: 20,
                  child: Text(
                    widget.textOff,
                    style: TypographyStyle.body1Reguler.copyWith(
                        color: ColorStyle.whiteColor.withOpacity(.85)),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset(-5 * (1 - value), 0)
                  : Offset(5 * (1 - value), 0), //original
              child: Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Container(
                  padding: isRTL(context)
                      ? EdgeInsets.only(right: 5)
                      : EdgeInsets.only(left: 5),
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  height: 20,
                  child: Text(
                    widget.textOn,
                    style: TypographyStyle.body1Reguler.copyWith(
                        color: ColorStyle.whiteColor.withOpacity(.85)),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: isRTL(context)
                  ? Offset((-widget.width + 20) * value, 0)
                  : Offset((widget.width - 24) * value, 0),
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorStyle.whiteColor.withOpacity(.85)),
                  // child: Stack(
                  //   children: <Widget>[
                  //     Center(
                  //       child: Opacity(
                  //         opacity: (1 - value).clamp(0.0, 1.0),
                  //         child: Icon(
                  //           widget.iconOff,
                  //           size: 25,
                  //           color: transitionColor,
                  //         ),
                  //       ),
                  //     ),
                  //     Center(
                  //       child: Opacity(
                  //         opacity: value.clamp(0.0, 1.0),
                  //         child: Icon(
                  //           widget.iconOn,
                  //           size: 21,
                  //           color: transitionColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _action() {
    _determine(changeState: true);
  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();

      widget.onChanged(turnState);
    });
  }
}

bool isRTL(BuildContext context) {
  return Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode);
}
