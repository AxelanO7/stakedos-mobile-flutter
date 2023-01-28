import 'dart:async';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/home/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), (() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Image.asset(
            'assets/icons/logo_stakedos.png',
            scale: 0.9,
          )),
    );
  }
}
