
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../values/styles/colors.dart';
import '../values/styles/constans.dart';

part 'AppStore.g.dart';


class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {

  double i = 0;


  bool isDarkModeOn = false;


  bool isHover = false;

  Color? scaffoldBackground;

  Color? backgroundColor;


  Color? backgroundSecondaryColor;

  Color? textPrimaryColor;


  Color? appColorPrimaryLightColor;

  Color? textSecondaryColor;


  Color? appBarColor;


  Color? iconColor;


  Color? iconSecondaryColor;


  var selectedDrawerItem = -1;


  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if (isDarkModeOn) {
      scaffoldBackground = appBackgroundColorDark;

      appBarColor = appBackgroundColorDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      appColorPrimaryLightColor = cardBackgroundBlackDark;

      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;

      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;

      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
      shadowColorGlobal = appShadowColorDark;
    } else {
      scaffoldBackground = whiteColor;

      appBarColor = Colors.white;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      appColorPrimaryLightColor = appColorPrimaryLight;

      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;

      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;

      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
      shadowColorGlobal = appShadowColor;
    }
    setStatusBarColor(scaffoldBackground!);

    setValue(isDarkModeOnPref, isDarkModeOn);
  }


  void toggleHover({bool value = false}) => isHover = value;


  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }
}
