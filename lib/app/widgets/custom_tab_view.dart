import 'package:stakedos/app/core/base_import.dart';

class CustomTabView extends StatefulWidget {
  final List<Widget> child;
  final List<String> tabsTitle;

  CustomTabView({
    required this.tabsTitle,
    required this.child,
  });

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      PageView.builder(
        itemCount: widget.tabsTitle.length,
        controller: PageController(),
        scrollBehavior: CustomDisableGlowBehavior(),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, position) {
          switch (position) {
            case 0:
              return Container(
                child: Text(position.toString()),
              );
          }
          return Container(
            child: Text("test" + position.toString()),
          );
        },
      ),
    ]);
  }
}
