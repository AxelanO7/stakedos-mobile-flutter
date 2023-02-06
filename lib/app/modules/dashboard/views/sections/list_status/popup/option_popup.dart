import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/list_status/controller.dart';

class OptionPopup extends StatelessWidget {
  OptionPopup(StatusKehadiranData? dosenList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListStatusController>(
      builder: (controller) => SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                children: [
                  SizedBox(height: 36),
                  Text(
                    "Lihat Status Kehadiran",
                    style: TypographyStyle.body2Bold
                        .copyWith(color: ColorStyle().grayscaleRange[700]),
                  ),
                  Container(height: 2, color: ColorStyle().grayscaleRange[400]),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: controller.tapEdit,
                    child: Text(
                      "Ubah Status Kehadiran",
                      style: TypographyStyle.body2Bold
                          .copyWith(color: ColorStyle().grayscaleRange[700]),
                    ),
                  ),
                  Container(height: 2, color: ColorStyle().grayscaleRange[400]),
                  SizedBox(height: 20),
                  Text(
                    "Delete Status Kehadiran",
                    style: TypographyStyle.body2Bold
                        .copyWith(color: ColorStyle().grayscaleRange[700]),
                  ),
                  Container(height: 2, color: ColorStyle().grayscaleRange[400]),
                  SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
