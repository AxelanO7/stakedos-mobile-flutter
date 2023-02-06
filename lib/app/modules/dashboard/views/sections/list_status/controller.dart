import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/list_status/popup/option_popup.dart';
import 'package:stakedos/app/routes/app_pages.dart';

class ListStatusController extends BaseController {
  var mainScrollController = ScrollController();
  List<StatusKehadiranData?> dosenList = [];
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

  @override
  onInit() {
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
    _fDosenStatusEvent = _fDosenStatusRef?.onValue.listen(
      (DatabaseEvent event) async {
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
      },
    );
    isLoadingStatus = false;
    update();
  }

  tapItem(StatusKehadiranData? selectedStatus) async {
    // print(selectedStatus?.id);
    String selectId = selectedStatus?.id.toString() ?? '';
    await AuthUtils.setSelectId(selectId);
    await AlertHelper.showScaleDialog(OptionPopup(selectedStatus));
  }

  tapEdit() async {
    Get.toNamed(Routes.EDITDATA);
  }
}
