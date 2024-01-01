import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_test/core/app_route.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/resources.dart';
import 'package:youapp_test/core/resources/styles.dart';
import 'package:youapp_test/core/widgets/widgets.dart';
import 'package:youapp_test/utils/utils.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
    required this.dataMenu,
    required this.currentIndex,
    required this.onLogoutPressed,
  });

  final List<DataHelper> dataMenu;
  final Function(int) currentIndex;
  final VoidCallback onLogoutPressed;

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: context.widthInPercent(100),
            height: Dimens.header,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            color: Theme.of(context).extension<LzyctColors>()!.card,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You App",
                          style: Theme.of(context)
                              .textTheme
                              .titleLargeBold
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          "Through Shared Interests",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .extension<LzyctColors>()!
                                        .shadow,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpacerV(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.dataMenu
                    .map<Widget>(
                      (value) => SizedBox(
                        width: double.maxFinite,
                        child: InkWell(
                          onTap: () {
                            for (final menu in widget.dataMenu) {
                              menu.isSelected = menu.title == value.title;

                              if (value.title != null) {
                                widget.currentIndex(
                                  widget.dataMenu.indexOf(value),
                                );
                              }
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimens.space12,
                              horizontal: Dimens.space24,
                            ),
                            child: Text(
                              value.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Palette.backgroundDark,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                width: double.maxFinite,
                child: InkWell(
                  onTap: () {
                    widget.onLogoutPressed.call();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.space12,
                      horizontal: Dimens.space24,
                    ),
                    child: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Palette.backgroundDark,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ), //
        ],
      ),
    );
  }

  void _selectedPage(String title) {
    //Update page from selected Page
    if (title == 'Dashboard') {
      context.goNamed(Routes.dashboard.name);
    } else if (title == 'Logout') {
      widget.onLogoutPressed.call();
    }
  }
}
