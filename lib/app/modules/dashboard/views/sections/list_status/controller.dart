import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/apis/reqres/get_reqres_api.dart';
import 'package:stakedos/app/apis/status_kehadiran/get_status_kehadiran_api.dart';
import 'package:stakedos/app/apis/test/get_test_api.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/controllers/dashboard_controller.dart';

class ListStatusController extends BaseController {
  var mainScrollController = ScrollController();
  List<StatusKehadiranData?> dosenList = [];
  // List<TestData?> testList = [];
  // List<ReqresData?> reqresList = [];
  StatusKehadiranData? selectedStatus;

  FirebaseDatabase _fDB = FirebaseDatabase.instance;
  DatabaseReference? _fDosenStatusRef;
  StreamSubscription<DatabaseEvent>? _fDosenStatusEvent;

  EasyRefreshController refreshController = EasyRefreshController();

  List headerList = ['#', 'Nama Dosen', 'Status'];

  bool isLoadingStatus = false;

  @override
  listData({int? pageTo}) async {
    getDosenListData();
  }
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
    _fDosenStatusEvent?.cancel();
    _fDosenStatusRef = _fDB.ref('/stakedos/dosen');
    _fDosenStatusEvent =
        _fDosenStatusRef?.onValue.listen((DatabaseEvent event) async {
      final data = event.snapshot.value;
      if (data != null) {
        var respJson = json.encode(data);

        dosenList = [];
        Map<String, dynamic> rawData = json.decode(respJson);
        rawData.forEach((key, value) {
          var dataRaw = StatusKehadiranData.fromJson(value);
          dosenList.add(dataRaw);
        });
        isLoadingStatus = false;
        update();
      }
    });
    isLoadingStatus = false;
    update();
    // var result = await GetStatusKehadiranApi().request();
    // if (result.statusCode == 200) {
    //   dosenList = [];
    //   var data = result.data as List<StatusKehadiranData?>;
    //   data.forEach(
    //     (element) {
    //       if (element != null) {
    //         dosenList.add(element);
    //       }
    //     },
    //   );
    //   update();
    // }
  }
}
