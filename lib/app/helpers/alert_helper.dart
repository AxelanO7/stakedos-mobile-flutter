import 'package:stakedos/app/core/base_import.dart';

class AlertHelper {
  static showBottomSheet(Widget content,
      {bool canHide: true, bool disablePadding = false}) async {
    var data;
    data = await showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: canHide,
      enableDrag: canHide,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: Get.context!,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                  padding: EdgeInsets.only(
                      top: 16,
                      left: disablePadding
                          ? 0
                          : context.isTablet
                              ? context.isLargeTablet
                                  ? Get.width * .25
                                  : Get.width * .15
                              : 0,
                      right: disablePadding
                          ? 0
                          : context.isTablet
                              ? context.isLargeTablet
                                  ? Get.width * .25
                                  : Get.width * .15
                              : 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          85),
                  child: content),
            ));
      },
    );
    return data;
  }
}
