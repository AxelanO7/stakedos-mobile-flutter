// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/getwidget.dart';

// class CardListShimmer extends StatelessWidget {
//   final int numItem;
//   CardListShimmer({
//     this.numItem:5
//   });
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       children: [
//         for(var i=0; i<numItem;i++)
//           Padding(
//             padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 20),
//             child: GFShimmer(
//                 child: Container(
//                   height: 150,
//                   width: Get.width,
//                   decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.all(Radius.circular(20))
//                   ),
//                 )
//             ),
//           ),

//       ],
//     );
//   }
// }
