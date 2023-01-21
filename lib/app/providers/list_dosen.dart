import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:stakedos/app/models/list_dosen/list_dosen.dart';

class ListDosen with ChangeNotifier {
  List<ListDosenProvider> _allListDosen = [];

  List<ListDosenProvider> get allListDosen => _allListDosen;

  int get jumlahListDosen => _allListDosen.length;

  ListDosenProvider selectById(String id) =>
      _allListDosen.firstWhere((element) => element.id == id);

  Future<void> addListDosen(
      String catatan,
      String kehadiranTempat,
      String namaDosen,
      String noTelepon,
      String password,
      String statusKehadiran,
      String tipeAkun,
      String token,
      String nidn) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://stakedos-23d7b-default-rtdb.asia-southeast1.firebasedatabase.app/dosenList.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "catatan": catatan,
          "kehadiran_tempat": kehadiranTempat,
          "nama_dosen": namaDosen,
          "nidn": nidn,
          "no_telepon": noTelepon,
          "password": password,
          "status_kehadiran": statusKehadiran,
          "tipe_akun": tipeAkun,
          "token": token,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allListDosen.add(
          ListDosenProvider(
            id: json.decode(response.body)["name"].toString(),
            catatan: catatan,
            kehadiranTempat: kehadiranTempat,
            namaDosen: namaDosen,
            noTelepon: noTelepon,
            password: password,
            statusKehadiran: statusKehadiran,
            tipeAkun: tipeAkun,
            token: token,
            nidn: nidn,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editListDosen(
      String id,
      String catatan,
      String kehadiranTempat,
      String namaDosen,
      String noTelepon,
      String password,
      String statusKehadiran,
      String tipeAkun,
      String token,
      String nidn) {
    Uri url = Uri.parse(
        "https://stakedos-23d7b-default-rtdb.asia-southeast1.firebasedatabase.app/ListDosens/$id.json");
    return http
        .put(
      url,
      body: json.encode(
        {
          "catatan": catatan,
          "kehadiran_tempat": kehadiranTempat,
          "nama_dosen": namaDosen,
          "nidn": nidn,
          "no_telepon": noTelepon,
          "password": password,
          "status_kehadiran": statusKehadiran,
          "tipe_akun": tipeAkun,
          "token": token,
        },
      ),
    )
        .then(
      (response) {
        ListDosenProvider selectListDosen =
            _allListDosen.firstWhere((element) => element.id == id);
        selectListDosen.catatan = catatan;
        selectListDosen.kehadiranTempat = kehadiranTempat;
        selectListDosen.namaDosen = namaDosen;
        selectListDosen.noTelepon = noTelepon;
        selectListDosen.password = password;
        selectListDosen.statusKehadiran = statusKehadiran;
        selectListDosen.tipeAkun = tipeAkun;
        selectListDosen.token = token;
        selectListDosen.nidn = nidn;
        notifyListeners();
      },
    );
  }

  Future<void> deleteListDosen(String id) {
    Uri url = Uri.parse(
        "https://stakedos-23d7b-default-rtdb.asia-southeast1.firebasedatabase.app/ListDosens/$id.json");
    return http.delete(url).then(
      (response) {
        _allListDosen.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://stakedos-23d7b-default-rtdb.asia-southeast1.firebasedatabase.app/ListDosens.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach(
      (key, value) {
        DateTime dateTimeParse =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        _allListDosen.add(
          ListDosenProvider(
            id: key,
            createdAt: dateTimeParse,
            catatan: value["catatan"],
            kehadiranTempat: value["kehadiranTempat"],
            namaDosen: value["namaDosen"],
            noTelepon: value["noTelepon"],
            password: value["password"],
            statusKehadiran: value["statusKehadiran"],
            tipeAkun: value["tipeAkun"],
            token: value["token"],
            nidn: value["nidn"],
          ),
        );
      },
    );
    print("BERHASIL MASUKAN DATA LIST");

    notifyListeners();
  }
}
