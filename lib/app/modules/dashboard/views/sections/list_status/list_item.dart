import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/list_status/controller.dart';

class ListItem extends StatelessWidget {
  final Function() onTap;
  final ListStatusController controller;
  final StatusKehadiranData? item;
  final int index;

  ListItem(this.onTap, this.controller, this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // Container(
                //   color: Colors.yellow,
                //   width: 40,
                //   child: Text('${widget.item?.id}'),
                // ),
                Expanded(
                  child: Container(
                    color: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        '${item?.namaDosen}',
                        style: TypographyStyle.body1SemiBold
                            .copyWith(color: ColorStyle().grayscaleRange[800]),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.orange,
                  child: Text(
                    '${item?.statusKehadiran}',
                    textAlign: TextAlign.center,
                    style: TypographyStyle.body1SemiBold
                        .copyWith(color: ColorStyle().grayscaleRange[800]),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Divider(
                thickness: 2,
                color: ColorStyle().grayscaleRange[200],
              ),
            )
          ],
        ),
      ),
    );
  }
}
