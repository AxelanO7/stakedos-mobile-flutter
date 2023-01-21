// import 'package:stakedos/app/core/base_import.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_tex/flutter_tex.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// class TryoutContentLoader extends StatelessWidget {
//   final String? tryoutContentString;
//   final Color? customColor;

//   const TryoutContentLoader(
//       {Key? key, required this.tryoutContentString, this.customColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return HtmlWidget(
//       tryoutContentString ?? '-',
//       textStyle: TypographyStyle.body1Medium.copyWith(
//         fontSize: 16,
//         color: customColor ?? ColorStyle().grayscaleRange[900],
//       ),
//       customWidgetBuilder: (e) {
//         if (e.outerHtml.contains('span class="math-tex"')) {
//           return AbsorbPointer(
//             child: SizedBox(
//               child: TeXView(
//                 renderingEngine: TeXViewRenderingEngine.mathjax(),
//                 loadingWidgetBuilder: (context) {
//                   return CupertinoActivityIndicator();
//                 },
//                 child: TeXViewDocument(
//                   e.innerHtml,
//                   style: TeXViewStyle(
//                       // fontStyle: TeXViewFontStyle(),
//                       ),
//                 ),
//               ),
//             ),
//           );
//         } else if (e.classes.contains('img')) {
//           return CachedNetworkImage(
//             imageUrl: tryoutContentString ?? '-',
//             placeholder: (context, url) => Container(
//               padding: EdgeInsets.all(16),
//               child: CupertinoActivityIndicator(),
//             ),
//             errorWidget: (context, url, error) => Icon(Icons.error),
//           );
//         } else {
//           return null;
//         }
//       },
//     );
//   }
// }
