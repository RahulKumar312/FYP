import 'package:flutter/material.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:stacked/stacked.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../common/app_colors.dart';

class HireViewModel extends BaseViewModel {
  List<SalomonBottomBarItem> bottomcontents = [
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.home_outlined,
        color: kcDarkGreyColor,
      ),
      activeIcon: const Icon(
        Icons.home,
        color: kcDarkGreyColor,
      ),
      title: text_helper(
        data: "home",
        font: poppins,
        color: kcDarkGreyColor,
        size: fontSize12,
        bold: true,
      ),
      selectedColor: white,
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.cleaning_services,
        color: kcDarkGreyColor,
      ),
      activeIcon: const Icon(
        Icons.cleaning_services_outlined,
        color: kcDarkGreyColor,
      ),
      title: text_helper(
        data: "service",
        font: poppins,
        color: kcDarkGreyColor,
        size: fontSize12,
        bold: true,
      ),
      selectedColor: white,
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.border_color,
        color: kcDarkGreyColor,
      ),
      activeIcon: const Icon(
        Icons.border_color,
        color: kcDarkGreyColor,
      ),
      title: text_helper(
        data: "order",
        font: poppins,
        color: kcDarkGreyColor,
        size: fontSize12,
        bold: true,
      ),
      selectedColor: white,
    ),
  ];

  int currentIndex = 0;
  void updateindex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
