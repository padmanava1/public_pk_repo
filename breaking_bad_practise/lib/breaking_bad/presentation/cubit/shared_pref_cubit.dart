import 'package:breaking_bad_practise/core/base/base_state.dart';
import 'package:breaking_bad_practise/utils/app_consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/make_my_trip_theme.dart';

class PrefCubit extends Cubit<BaseState> {
  PrefCubit() : super(StateInitial());
  late SharedPreferences preferences;

  setupLocalStorage() async {
    preferences = await SharedPreferences.getInstance();
  }

  bool getDarkMode() {
    return preferences.getBool(AppConstants.darkModeKey) ?? false;
  }

  Future<bool> setDarkMode(bool val) async {
    return await preferences.setBool(AppConstants.darkModeKey, val);
  }

  void changeCurrentTheme() {
    Get.changeTheme(getDarkMode()
        ? BreakingBadTheme.darkTheme
        : BreakingBadTheme.lightTheme);
  }
}
