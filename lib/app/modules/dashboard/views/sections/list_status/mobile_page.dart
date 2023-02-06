import 'package:lottie/lottie.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/list_status/list_item.dart';

import 'controller.dart';

class ListStatusMobilePage extends StatelessWidget {
  const ListStatusMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListStatusController>(
      init: ListStatusController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: (controller.isLoadingStatus || controller.isLoadingListDosen)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: Lottie.asset('assets/animations/loader.json',
                            width: 54, height: 54, frameRate: FrameRate(60)),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    EasyRefresh(
                      header: MaterialHeader(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorStyle.secondaryColor)),
                      controller: controller.refreshController,
                      onRefresh: controller.onRefresh,
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            _header(context, controller),
                            ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.dosenList.length,
                              itemBuilder: (context, index) {
                                var item = controller.dosenList[index];
                                return ListItem(
                                  () => controller.tapItem(
                                    controller.dosenList[index],
                                  ),
                                  controller,
                                  item,
                                  index,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context, ListStatusController controller) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: Get.width,
          height: 36,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "List Status",
              style: TypographyStyle.body2SemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            thickness: 2,
            color: ColorStyle().grayscaleRange[200],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
          child: Row(
            children: [
              // Container(
              //   color: Colors.red,
              //   width: 40,
              //   child: Text(
              //     '#',
              //     style: TypographyStyle.body1SemiBold.copyWith(
              //       color: ColorStyle().grayscaleRange[800],
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Nama Dosen',
                      style: TypographyStyle.body1SemiBold
                          .copyWith(color: ColorStyle().grayscaleRange[800]),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                color: Colors.green,
                child: Text(
                  'Status',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.body1SemiBold
                      .copyWith(color: ColorStyle().grayscaleRange[800]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 12),
          child: Divider(
            thickness: 2,
            color: ColorStyle().grayscaleRange[200],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
