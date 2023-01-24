import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/apis/reqres/get_reqres_api.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';

class ListStatusController extends BaseController {
  var mainScrollController = ScrollController();
  final DashboardController rootController;
  List<StatusKehadiranData?> dosenList = [];
  List<TestData?> testList = [];
  List<ReqresData?> reqresList = [];
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
    var result = await GetReqresApi().request();
    if (result.statusCode == 200) {
      reqresList = [];
      var data = result.data as List<ReqresData?>;
      data.forEach(
        (element) {
          if (element != null) {
            reqresList.add(element);
          }
        },
      );
      update();
    }
    isLoadingStatus = false;
    update();
  }
}
