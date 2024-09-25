import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker {
  static changeOnEnglish(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal != const Locale('en', 'US')) {
      changeLanguge(context);
    }
  }

  static changeOnUrdu(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      changeLanguge(context);
    }
  }

  static changeLanguge(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('ur', 'PK'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }

  static bool isurdu(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    return currentLocal == const Locale('ur', 'PK');
  }
}
