import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/apis/status_kehadiran/get_status_kehadiran_api.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:stakedos/app/providers/list_dosen.dart';
import 'package:provider/provider.dart';

class ListStatusController extends BaseController {
  var mainScrollController = ScrollController();
  final DashboardController rootController;
  List<StatusKehadiranData?> dosenList = [];
  StatusKehadiranData? selectedStatus;

  EasyRefreshController refreshController = EasyRefreshController();

  List headerList = ['#', 'Nama Dosen', 'Status'];

  bool isLoadingStatus = false;

  ListStatusController({required this.rootController});

  // bool isInit = true;
  // @override
  // void didChangeDependencies() {
  //   if (isInit) {
  //     Provider.of<ListDosen>(context).initialData();
  //   }
  //   isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  onInit() {
    // dosenList.add(StatusKehadiranData()
    //   ..id = 1
    //   ..namaDosen = 'dosen1'
    //   ..statusKehadiran = 'hadir');
    // dosenList.add(StatusKehadiranData()
    //   ..id = 2
    //   ..namaDosen = 'dosen2'
    //   ..statusKehadiran = 'tidak hadir');
    // dosenList.add(StatusKehadiranData()
    //   ..id = 3
    //   ..namaDosen = 'dosen3'
    //   ..statusKehadiran = 'hadir');

    super.onInit();
    isLoading = true;
    update();
  }

  @override
  onReady() async {
    isLoading = false;
    getDosenListData();
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  getDosenListData() async {
    isLoadingStatus = true;
    update();
    var result = await GetStatusKehadiranApi().request();
    if (result.statusCode == 200) {
      dosenList = [];
      var data = result.listData as List<StatusKehadiranData?>;
      data.forEach(
        (element) {
          if (element != null) {
            dosenList.add(element);
          }
        },
      );
      update();
    }
    isLoadingStatus = false;
    update();
  }
}
