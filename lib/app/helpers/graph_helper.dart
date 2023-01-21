// import 'package:btw/src/core/base_import.dart';
// import 'package:fl_chart/fl_chart.dart';

// class GraphHelper {
//   static Color getPercentageColor(double progress) {
//     // from avgPercentScore
//     if (progress <= 70) {
//       return HexColor('FF5569');
//     }
//     if (progress <= 95) {
//       return HexColor('FE9E00');
//     }
//     return HexColor('17AF85');
//   }

//   static Color getResultGraphColor(String examProficiency) {
//     // from studentProfileResult?.examProficiency
//     if (examProficiency == "BEGINNER") {
//       return HexColor('FE9E00');
//     }
//     if (examProficiency == "INTERMEDIATE") {
//       return HexColor('FE9E00');
//     }
//     if (examProficiency == "ADVANCE") {
//       return HexColor('17AF85');
//     }
//     if (examProficiency == "EXPERT") {
//       return HexColor('17AF85');
//     }
//     return HexColor('FE9E00');
//   }

//   static String getExamExperience(String examProficiency) {
//     // from studentProfileResult?.examProficiency
//     if (examProficiency == "BEGINNER") {
//       return "Beg";
//     }
//     if (examProficiency == "INTERMEDIATE") {
//       return "Int";
//     }
//     if (examProficiency == "ADVANCE") {
//       return "Adv";
//     }
//     if (examProficiency == "EXPERT") {
//       return "Exp";
//     }
//     return "Beg";
//   }

//   static double getExamExperienceLevel(String examProficiency) {
//     // from studentProfileResult?.examProficiency
//     if (examProficiency == "BEGINNER") {
//       return .25;
//     }
//     if (examProficiency == "INTERMEDIATE") {
//       return .5;
//     }
//     if (examProficiency == "ADVANCE") {
//       return .75;
//     }
//     if (examProficiency == "EXPERT") {
//       return 1;
//     }
//     return 0;
//   }

//   static String getCATExperience(String proficiency) {
//     //from studentProfileResult?.proficiency
//     if (proficiency == "BEGINNER") {
//       return "Beg";
//     }
//     if (proficiency == "INTERMEDIATE") {
//       return "Int";
//     }
//     if (proficiency == "ADVANCE") {
//       return "Adv";
//     }
//     if (proficiency == "EXPERT") {
//       return "Exp";
//     }
//     return "Beg";
//   }

//   static double getCATExperienceLevel(String proficiency) {
//     //from studentProfileResult?.proficiency
//     if (proficiency == "BEGINNER") {
//       return .25;
//     }
//     if (proficiency == "INTERMEDIATE") {
//       return .5;
//     }
//     if (proficiency == "ADVANCE") {
//       return .75;
//     }
//     if (proficiency == "EXPERT") {
//       return 1;
//     }
//     return 0;
//   }

//   static Color getLevelColor(double progress) {
//     if (progress >= .75) {
//       return HexColor("17AF85");
//     }
//     if (progress >= .5) {
//       return HexColor("FE9D00");
//     }
//     if (progress >= 0) {
//       return HexColor("FF5569");
//     }
//     return HexColor("FF5569");
//   }

//   static List<FlSpot> getLastTenUkaResult(StudentResult? studentProfileResult, {bool isReverse: false}) {
//     List<FlSpot> graphSpotList = [];
//     var sorted = studentProfileResult?.result;
//     // sorted?.sort((a, b) => a == null
//     //     ? 1
//     //     : b == null
//     //         ? -1
//     //         : b.date.compareTo(a.date));

//     if ((sorted?.length ?? 0) <= 10) {
//       for (int i = 0; i < (sorted?.length ?? 0); i++) {
//         graphSpotList.add(FlSpot(i + 1, (sorted?[i]?.total ?? 0)));
//       }
//     } else {
//       for (int i = 0; i < 10; i++) {
//         graphSpotList.add(FlSpot(i + 1, (sorted?[i]?.total ?? 0)));
//       }
//     }

//     return graphSpotList;
//   }

//   static List<int> getLastTenUkaIndexLong(List<FlSpot> graphSpotList) {
//     List<int> indexLong = [];

//     for (int i = 0; i < graphSpotList.length; i++) {
//       indexLong.add(i);
//     }

//     return indexLong;
//   }

//   static List<String> getLastTenUkaDate(StudentResult? studentProfileResult, {bool isReverse: false}) {
//     List<String> graphDate = [];
//     var sorted = studentProfileResult?.result;
//     // sorted?.sort((a, b) => a == null
//     //     ? 1
//     //     : b == null
//     //         ? -1
//     //         : b.date.compareTo(a.date));

//     if ((sorted?.length ?? 0) <= 10) {
//       for (int i = 0; i < (sorted?.length ?? 0); i++) {
//         graphDate.add(sorted?[i]?.date ?? '');
//       }
//     } else {
//       for (int i = 0; i < 10; i++) {
//         graphDate.add(sorted?[i]?.date ?? '');
//       }
//     }

//     return graphDate;
//   }

//   static List<LevelList?> getStageLocation(MiniStages? stages) {
//     List<LevelList?> level = [];

//     if (stages?.levelList == null || stages?.levelList.length == 0) {
//       return level;
//     }
//     //get current stage position
//     int stageLocation = stages?.studentCurrentLevel ?? 0;

//     //if stage current = 0
//     if (stageLocation == 0) {
//       LevelList zeroLevel = LevelList();
//       zeroLevel.level = 0;
//       zeroLevel.originalCoinAmount = 0;
//       zeroLevel.coinAmount = 0;
//       zeroLevel.id = 0;
//       zeroLevel.available = false;
//       zeroLevel.isPurchased = false;
//       level.add(zeroLevel);

//       for (int i = 0; i < 4; i++) {
//         level.add(stages?.levelList[i]);
//       }
//       level.add(stages?.levelList.last);
//     }

//     //if stage current = 1-4
//     if (stageLocation >= 1 && stageLocation <= 4) {
//       for (int i = 0; i < 5; i++) {
//         level.add(stages?.levelList[i]);
//       }
//       level.add(stages?.levelList.last);
//     }

//     //if stage current = 5-13
//     if (stageLocation >= 5 && stageLocation <= 13) {
//       level.add(stages?.levelList[stageLocation - 3]);
//       level.add(stages?.levelList[stageLocation - 2]);
//       level.add(stages?.levelList[stageLocation - 1]);
//       level.add(stages?.levelList[stageLocation]);
//       level.add(stages?.levelList[stageLocation + 1]);
//       level.add(stages?.levelList.last);
//     }

//     //if stage current = 14-16
//     if (stageLocation >= 14 && stageLocation <= 16) {
//       level = stages!.levelList.sublist(stages.levelList.length - 5);
//     }

//     return level;
//   }
// }
