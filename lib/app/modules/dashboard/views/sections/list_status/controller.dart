import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/apis/reqres/get_reqres_api.dart';
import 'package:stakedos/app/apis/status_kehadiran/get_status_kehadiran_api.dart';
import 'package:stakedos/app/apis/test/get_test_api.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';

class ListStatusController extends BaseController {
  var mainScrollController = ScrollController();
  List<StatusKehadiranData?> dosenList = [];
  List<TestData?> testList = [];
  List<ReqresData?> reqresList = [];
  StatusKehadiranData? selectedStatus;

  EasyRefreshController refreshController = EasyRefreshController();

  List headerList = ['#', 'Nama Dosen', 'Status'];

  bool isLoadingStatus = false;

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

    isLoading = true;
    super.onInit();
  }

  @override
  onReady() async {
    await getDosenListData();
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
      var data = result.data as List<StatusKehadiranData?>;
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
