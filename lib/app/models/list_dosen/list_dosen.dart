class ListDosenProvider {
  String catatan,
      kehadiranTempat,
      namaDosen,
      noTelepon,
      password,
      statusKehadiran,
      tipeAkun,
      token,
      id,
      nidn;
  DateTime createdAt;

  ListDosenProvider(
      {required this.catatan,
      required this.kehadiranTempat,
      required this.namaDosen,
      required this.noTelepon,
      required this.password,
      required this.statusKehadiran,
      required this.tipeAkun,
      required this.token,
      required this.id,
      required this.nidn,
      required this.createdAt});
}
