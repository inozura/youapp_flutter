import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/utils/utils.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const _Loading());

  int _currentIndex = 0;
  late List<DataHelper> dataMenus;

  void updateIndex(int index, {BuildContext? context}) {
    emit(const _Loading());
    _currentIndex = index;
    if (context != null) {
      initMenu(context);
    }
    emit(_Success(dataMenus[_currentIndex]));
  }

  void initMenu(BuildContext context) {
    dataMenus = [
      DataHelper(
        title: 'Dashboard',
        isSelected: true,
      ),
    ];
    updateIndex(_currentIndex);
  }

  bool onBackPressed(
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldState,
  ) {
    if (dataMenus[_currentIndex].title == 'Dashboard') {
      return true;
    } else {
      if (scaffoldState.currentState!.isEndDrawerOpen) {
        //hide navigation drawer
        scaffoldState.currentState!.openDrawer();
      } else {
        for (final menu in dataMenus) {
          menu.isSelected = menu.title == 'Dashboard';
        }
      }

      return false;
    }
  }
}
