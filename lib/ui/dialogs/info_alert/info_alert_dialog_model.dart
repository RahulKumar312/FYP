import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/localizationhelper/localization_checker.dart';

class InfoAlertDialogModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void english(BuildContext context) {
    LocalizationChecker.changeOnEnglish(context);
    _navigationService.back();
  }

  void urdu(BuildContext context) {
    LocalizationChecker.changeOnUrdu(context);
    _navigationService.back();
  }
}
