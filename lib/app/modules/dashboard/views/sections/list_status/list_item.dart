import 'package:stakedos/app/core/base_import.dart';
import 'package:stakedos/app/modules/dashboard/views/sections/list_status/controller.dart';

class ListItem extends StatefulWidget {
  final ListStatusController controller;
  final ReqresData? item;
  final int index;

  ListItem(this.controller, this.item, this.index);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                color: Colors.yellow,
                width: 32,
                child: Text('${widget.item?.id}'),
              ),
              Container(
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    '${widget.item?.firstName}',
                    style: TypographyStyle.body1SemiBold
                        .copyWith(color: ColorStyle().grayscaleRange[800]),
                  ),
                ),
              ),
              Container(
                color: Colors.orange,
                child: Text(
                  '${widget.item?.lastName}',
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
    );
  }
}
