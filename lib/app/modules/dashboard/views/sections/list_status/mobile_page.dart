import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/list_status/list_item.dart';

import 'controller.dart';

class ListStatusMobilePage extends StatefulWidget {
  final DashboardController rootController;
  const ListStatusMobilePage({Key? key, required this.rootController})
      : super(key: key);
  @override
  _ListStatusMobilePageState createState() => _ListStatusMobilePageState();
}

class _ListStatusMobilePageState extends State<ListStatusMobilePage>
    with AutomaticKeepAliveClientMixin<ListStatusMobilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<ListStatusController>(
      init: ListStatusController(rootController: widget.rootController),
      builder: (controller) => Stack(
        children: [
          EasyRefresh(
            header: MaterialHeader(
                valueColor:
                    AlwaysStoppedAnimation<Color>(ColorStyle.secondaryColor)),
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  _header(context, controller),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.dosenList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.dosenList[index];
                      return ListItem(controller, item, index);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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
              Container(
                color: Colors.red,
                width: 32,
                child: Expanded(
                  flex: 1,
                  child: Text(
                    '#',
                    style: TypographyStyle.body1SemiBold.copyWith(
                      color: ColorStyle().grayscaleRange[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
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
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'Status',
                    textAlign: TextAlign.center,
                    style: TypographyStyle.body1SemiBold
                        .copyWith(color: ColorStyle().grayscaleRange[800]),
                  ),
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
