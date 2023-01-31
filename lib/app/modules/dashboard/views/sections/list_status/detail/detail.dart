import 'package:stakedos/app/core/base_import.dart';

class DetailPage extends StatelessWidget {
  StatusKehadiranData? dosenList;

  DetailPage(dosenList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('${dosenList?.namaDosen}}'),
          Text('${dosenList?.nidn}}'),
          Text('${dosenList?.noTelepon}}'),
          Text('${dosenList?.statusKehadiran}}'),
          Text('${dosenList?.kehadiranTempat}}'),
          Text('${dosenList?.catatan}}'),
        ],
      ),
    );
  }
}
