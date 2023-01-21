// import 'dart:async';

// import 'package:stakedos/app/core/base_import.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:lottie/lottie.dart';

// class CustomTypeAheadTextField<T extends Object> extends StatelessWidget {
//   final String? hintText, errorText;
//   final double? fixedHeight;
//   final bool isLoading, enabled;
//   final TextEditingValue? textEditingValue;
//   final TextEditingController? textEditingController;
//   final FutureOr<Iterable<T>> Function(String) suggestionsCallback;
//   final void Function(T) onSuggestionSelected;
//   final String? Function(String?)? validator;
//   final void Function(String?)? onSaved;
//   final Widget Function(BuildContext, T) itemBuilder;

//   const CustomTypeAheadTextField(
//       {Key? key,
//       this.isLoading = false,
//       this.enabled = true,
//       this.hintText,
//       this.errorText,
//       this.fixedHeight,
//       this.textEditingController,
//       required this.suggestionsCallback,
//       required this.onSuggestionSelected,
//       required this.itemBuilder,
//       this.validator,
//       this.onSaved,
//       this.textEditingValue})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TypeAheadFormField<T>(
//           enabled: enabled,
//           textFieldConfiguration: TextFieldConfiguration(
//             controller: textEditingController,
//             enabled: enabled,
//             cursorColor: ColorStyle().grayscaleRange[700], //cursor color
//             style: TypographyStyle.body1Bold.copyWith(
//                 fontSize: 16, color: ColorStyle().grayscaleRange[700]),
//             decoration: InputDecoration(
//               fillColor: !(enabled)
//                   ? ColorStyle().grayscaleRange[100]
//                   : null, //fill color
//               suffixIcon: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (isLoading)
//                     SizedBox(
//                       height: 16,
//                       width: 16,
//                       child: Lottie.asset('assets/animations/loader.json',
//                           width: 54, height: 54, frameRate: FrameRate(60)),
//                     ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     child: SvgPicture.asset('assets/icons/main/chevron_l.svg',
//                         color: (ColorStyle().grayscaleRange[400]!)),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                 ],
//               ),
//               filled: !(enabled) ? true : false, //set red color
//               hintText: hintText ?? 'Placeholder Text...', //hint
//               hintStyle: TypographyStyle.body1Bold.copyWith(
//                   color: ColorStyle().grayscaleRange[400],
//                   fontSize: 15), //hint style
//               contentPadding: EdgeInsets.only(left: 16, right: 0, top: 16),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide(
//                   color: errorText != null
//                       ? ColorStyle().redRange[400]!
//                       : ColorStyle().blueRange[300]!, //border active color
//                   width: 2,
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide(
//                   color:
//                       ColorStyle().grayscaleRange[200]!, //border enable color
//                   width: 2,
//                 ),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide(
//                   color:
//                       ColorStyle().grayscaleRange[200]!, //border enable color
//                   width: 2,
//                 ),
//               ),
//             ),
//           ),
//           suggestionsCallback: enabled ? suggestionsCallback : (_) => [],
//           itemBuilder: enabled ? itemBuilder : (_, __) => SizedBox.shrink(),
//           transitionBuilder: enabled
//               ? (context, suggestionsBox, controller) {
//                   return suggestionsBox;
//                 }
//               : (_, __, ___) => SizedBox.shrink(),
//           onSuggestionSelected: onSuggestionSelected,
//           validator: validator,
//           onSaved: onSaved,
//         ),
//         errorText != null && errorText!.length > 0
//             ? Padding(
//                 padding: const EdgeInsets.only(
//                   top: 4.0,
//                 ),
//                 child: Row(
//                   children: [
//                     SvgPicture.asset(
//                         "assets/icons/basics/ic_basic_circle_warning.svg",
//                         height: 16,
//                         width: 16,
//                         color: ColorStyle().redRange[400]),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       errorText ?? '',
//                       style: TypographyStyle.body3Medium
//                           .copyWith(color: ColorStyle().redRange[400]),
//                     ),
//                   ],
//                 ),
//               )
//             : SizedBox.shrink(),
//       ],
//     );
//   }
// }
