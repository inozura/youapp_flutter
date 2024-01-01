import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/resources.dart';
import 'package:youapp_test/core/resources/styles.dart';
import 'package:youapp_test/core/widgets/widgets.dart';
import 'package:youapp_test/features/auth/pages/pages.dart';
import 'package:youapp_test/features/main/cubit/main_cubit.dart';
import 'package:youapp_test/features/main/menu_drawer.dart';
import 'package:youapp_test/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCubit>().initMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return context.read<MainCubit>().onBackPressed(context, _scaffoldKey);
      },
      child: Parent(
        scaffoldKey: _scaffoldKey,
        drawer: SizedBox(
          width: context.widthInPercent(80),
          child: MenuDrawer(
            dataMenu: context.read<MainCubit>().dataMenus,
            currentIndex: (int index) {
              /// don't update when index is logout
              if (index != 2) {
                context.read<MainCubit>().updateIndex(index);
              }

              /// hide navigation drawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
            onLogoutPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: Palette.backgroundDark,
                  title: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context)
                            .extension<LzyctColors>()!
                            .subtitle),
                  ),
                  content: Text(
                    'Are you sure want to logout?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.back(),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .extension<LzyctColors>()!
                                  .subtitle,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().logout();
                      },
                      child: Text(
                        'Yes',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .extension<LzyctColors>()!
                                  .red,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        child: widget.child,
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: BlocBuilder<MainCubit, MainState>(
          builder: (_, state) {
            return Text(
              state.when(
                loading: () => "-",
                success: (data) => data?.title ?? "-",
              ),
              style: Theme.of(context).textTheme.titleLarge,
            );
          },
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: Dimens.space24,
            color: Theme.of(context).extension<LzyctColors>()!.pink,
            semanticLabel: "Menu",
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: const [
          /// Notification on Dashboard
          ButtonNotification(),
        ],
      ),
    );
  }
}
