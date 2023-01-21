import 'package:stakedos/app/styles/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarBackButton extends StatelessWidget {
  final bool darkTheme;
  final Color arrowColor;
  final Function()? onGoBack;

  AppBarBackButton(
      {this.darkTheme: true, this.arrowColor = Colors.white, this.onGoBack});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      // icon: Icon(
      //     Icons.arrow_back,
      //   color: darkTheme ? Colors.black : arrowColor,
      // ),
      icon: SvgPicture.asset(
        'assets/icons/back.svg',
        color: darkTheme ? ColorStyle.blackColor : arrowColor,
      ),
      onPressed: onGoBack ?? () => Get.back(),
    );
  }
}
