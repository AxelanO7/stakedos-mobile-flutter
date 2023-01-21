import 'package:stakedos/app/core/base_import.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CustomAutocompleteTextField<T extends Object> extends StatelessWidget {
  final List<T> list;
  final String? hintText;
  final double? fixedHeight;
  final bool isLoading, enabled;
  final Function(T) onSelected;
  final String Function(T) itemTitle;
  final TextEditingValue? textEditingValue;
  final TextEditingController? textEditingController;

  const CustomAutocompleteTextField(
      {Key? key,
      required this.list,
      this.isLoading = false,
      this.enabled = true,
      this.hintText,
      this.fixedHeight,
      this.textEditingController,
      required this.onSelected,
      required this.itemTitle,
      this.textEditingValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      initialValue: textEditingValue ?? null,
      displayStringForOption: itemTitle,
      fieldViewBuilder:
          (context, textEditingOriginController, focusNode, onFieldSubmitted) {
        return CustomTextField(
          enabled: enabled
              ? isLoading
                  ? false
                  : true
              : enabled,
          hintText: hintText ?? 'Placeholder...',
          controller:
              TextFieldController(controller: textEditingOriginController),
          focusNode: focusNode,
          suffixIcon: TextFieldIconWidget(
            customWidget: isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Lottie.asset('assets/animations/loader.json',
                            width: 54, height: 54, frameRate: FrameRate(60)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: SvgPicture.asset('assets/icons/dropdown.svg',
                            color: (ColorStyle().grayscaleRange[400]!)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  )
                : null,
            SvgAssetsPath: isLoading ? null : 'assets/icons/dropdown.svg',
            padding: isLoading
                ? null
                : EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return SafeArea(
          top: false,
          bottom: true,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(maxHeight: 200),
              width: Get.width - 32,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: ScrollConfiguration(
                  behavior: CustomDisableGlowBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        options.length,
                        (index) {
                          final T option = options.elementAt(index);
                          return InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(
                                "${itemTitle(option)}",
                                style: TypographyStyle.body2Bold.copyWith(
                                  color: ColorStyle.blackColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return list;
        }
        return list.where((T option) {
          return itemTitle(option)
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: onSelected,
    );
  }
}
