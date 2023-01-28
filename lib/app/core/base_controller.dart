import 'dart:io';

import 'base_import.dart';
import 'base_service.dart';

class BaseController extends GetxController with WidgetsBindingObserver {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    update();
  }

  bool _isLoadingListDosen = false;
  bool get isLoadingListDosen => _isLoadingListDosen;
  set isLoadingListDosen(val) {
    _isLoadingListDosen = val;
    update();
  }

  // bool _isLoadingResultPTN = false;
  // bool get isLoadingResultPTN => _isLoadingResultPTN;
  // set isLoadingResultPTN(val) {
  //   _isLoadingResultPTN = val;
  //   update();
  // }

  // bool _isLoadingResultPTK = false;
  // bool get isLoadingResultPTK => _isLoadingResultPTK;
  // set isLoadingResultPTK(val) {
  //   _isLoadingResultPTK = val;
  //   update();
  // }

  // StudentResult? studentProfilePTNResult;
  // StudentResult? studentProfilePTKResult;

  bool _isShowTopOverlay = false;
  bool get isShowTopOverlay => _isShowTopOverlay;
  set isShowTopOverlay(val) {
    _isShowTopOverlay = val;
    update();
  }

  bool _isLoadingProfile = false;
  bool get isLoadingProfile => _isLoadingProfile;
  set isLoadingProfile(val) {
    _isLoadingProfile = val;
    update();
  }

  // User studentProfile = User();
  // ScreenArguments? screenArguments;
  // EasyRefreshController refreshController = EasyRefreshController();
  // String targetCategory = "ptk";

  @override
  onInit() async {
    // await loadTargetCategory();
    super.onInit();
  }

  // loadTargetCategory() async {
  //   LogUtils.systemLog("BaseEngine", "Loaded ${this.runtimeType}");
  //   if (Get.arguments != null) {
  //     if (Get.arguments is ScreenArguments) {
  //       screenArguments = Get.arguments as ScreenArguments;
  //       // } else if (Get.arguments is KesamaptaArguments) {
  //       //   kesamaptaArguments = Get.arguments as KesamaptaArguments;
  //       // }
  //     }
  //   }

  //   targetCategory = await SettingsUtils.getString("target_category");
  //   if (targetCategory != "ptk" && targetCategory != "ptn") {
  //     targetCategory = "ptk";
  //   }
  //   LogUtils.systemLog(
  //       "BaseEngine", "Category Choosen ${targetCategory.toUpperCase()}");
  // }

  @override
  void onReady() async {
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      print('SystemChannels> $msg');
      if (msg == AppLifecycleState.resumed.toString()) {
        if (Platform.isAndroid)
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
          ));
      }
      handleSystemChannel(msg);
      return msg;
    });

    super.onReady();
  }

  @override
  onClose() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == AppLifecycleState.resumed.toString()) {
        if (Platform.isAndroid)
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
          ));
      }
      return msg;
    });
    super.onClose();
  }

  listData({int? pageTo}) async {}

  Future<bool> onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      this.listData(pageTo: 1);
    });
    return true;
  }

  Future<bool> onLoadMore() async {
    await Future.delayed(Duration(seconds: 1), () {
      this.listData();
    });
    return true;
  }

  // tapChangeTargetCategory(bool val) async {
  //   if (val) {
  //     targetCategory = "ptk";
  //   } else {
  //     targetCategory = "ptn";
  //   }
  //   await SettingsUtils.set("target_category", targetCategory);
  //   LogUtils.systemLog(
  //       "BaseEngine", "Category Updated ${targetCategory.toUpperCase()}");
  //   update();
  // }

  handleSystemChannel(msg) {
    print('SystemChanneels> $msg');
  }

  Color getProficiencyColor(String proficiency) {
    switch (proficiency.toLowerCase()) {
      case "intermediate":
        return ColorStyle().orangeRange[700]!;
      case "advance":
        return ColorStyle().redRange[400]!;
      case "expert":
        return ColorStyle().blueRange[500]!;
    }
    return ColorStyle().grayscaleRange[400]!;
  }

  // openLink(String? url,
  //     {bool openBrowser: true,
  //     String title: '',
  //     bool replacePage: false,
  //     bool hideControl: false,
  //     bool isPayment: false}) async {
  //   if (url != null) {
  //     if (url.length > 10 && url.substring(0, 11) == "btwedutech-app://") {
  //       Get.toNamed(url.substring(11));
  //       return;
  //     } else if (openBrowser || CoreConfig.isDesktopClient) {
  //       try {
  //         await launchUrl(Uri.parse(url));
  //       } catch (e) {
  //         Fluttertoast.showToast(
  //             msg:
  //                 "Terjadi kesalahan, silahkan cek ulang izin Buka secara default aplikasi lalu coba lagi",
  //             toastLength: Toast.LENGTH_LONG,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 1,
  //             backgroundColor: ColorStyle.primaryLightColor,
  //             textColor: Colors.white,
  //             fontSize: 16.0);
  //       }
  //     } else {
  //       if (replacePage) {
  //         await Get.off(() => WebViewPage(
  //               url: url,
  //               title: title,
  //               hideControl: hideControl,
  //               isPayment: isPayment,
  //             ));
  //       } else {
  //         await Get.to(() => WebViewPage(
  //               url: url,
  //               title: title,
  //               hideControl: hideControl,
  //               isPayment: isPayment,
  //             ));
  //       }
  //     }
  //   }
  // }

  // getStudentProfile() async {
  //   isLoadingResultPTN = true;
  //   isLoadingResultPTK = true;
  //   isLoadingProfile = true;
  //   update();
  //   var result = await GetStudentProfileApi().request();
  //   if (result.status) {
  //     var profile = result.data as UserProfile?;
  //     studentProfile = profile!.userProfile;

  //     await SettingsUtils.set("student_name", studentProfile.namaLengkap);
  //     if (studentProfile.studentAvatar == null ||
  //         studentProfile.studentAvatar!.length < 1) {
  //       await SettingsUtils.set("student_ptn_avatar_id", (1).toString());
  //       await SettingsUtils.set("student_ptk_avatar_id", (1).toString());
  //     } else {
  //       studentProfile.studentAvatar?.forEach((element) async {
  //         print("saving ${element?.avaType.toLowerCase()}");
  //         await SettingsUtils.set(
  //             "student_${element?.avaType.toLowerCase()}_avatar_id",
  //             (element?.id).toString());
  //       });
  //     }

  //     if (studentProfile.ptkHasChoosen) {
  //       getProfileResultPTK();
  //     } else {
  //       isLoadingResultPTK = false;
  //     }
  //     if (studentProfile.ptnHasChoosen) {
  //       getProfileResultPTN();
  //     } else {
  //       isLoadingResultPTN = false;
  //     }
  //   }
  //   isLoadingProfile = false;
  //   update();
  // }

  // getStudentProfileOnly() async {
  //   isLoadingProfile = true;
  //   update();
  //   var result = await GetStudentProfileApi().request();
  //   if (result.status) {
  //     var profile = result.data as UserProfile?;
  //     studentProfile = profile!.userProfile;

  //     await SettingsUtils.set("student_name", studentProfile.namaLengkap);
  //     if (studentProfile.studentAvatar == null ||
  //         studentProfile.studentAvatar!.length < 1) {
  //       await SettingsUtils.set("student_ptn_avatar_id", (1).toString());
  //       await SettingsUtils.set("student_ptk_avatar_id", (1).toString());
  //     } else {
  //       studentProfile.studentAvatar?.forEach((element) async {
  //         print("saving ${element?.avaType.toLowerCase()}");
  //         await SettingsUtils.set(
  //             "student_${element?.avaType.toLowerCase()}_avatar_id",
  //             (element?.id).toString());
  //       });
  //     }
  //   }
  //   isLoadingProfile = false;
  //   update();
  // }

  // getProfileResultPTN() async {
  //   isLoadingResultPTN = true;
  //   update();
  //   var result =
  //       await GetStudentProfileResultApi().request(targetCategory: "ptn");
  //   if (result.status) {
  //     studentProfilePTNResult = result.data as StudentResult?;
  //   }
  //   isLoadingResultPTN = false;
  //   update();
  // }

  // getProfileResultPTK() async {
  //   isLoadingResultPTK = true;
  //   update();
  //   var result =
  //       await GetStudentProfileResultApi().request(targetCategory: "ptk");
  //   if (result.status) {
  //     studentProfilePTKResult = result.data as StudentResult?;
  //   }
  //   isLoadingResultPTK = false;
  //   update();
  // }
}
