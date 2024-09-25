import 'package:flutter/cupertino.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';
import 'package:servant_industry_hiring/ui/views/singnup/singnup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/sharedpref_service.dart';

class CategoryslectorViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedpref = locator<SharedprefService>();

  String cat = '';

  void hire() {
    cat = 'hire';
    notifyListeners();
  }

  void buy() {
    cat = 'servant';
    notifyListeners();
  }

  void next(BuildContext context) {
    if (cat == "") {
      show_snackbar(context, "selectacategory");
    } else {
      _sharedpref.setString("cat", cat);
      _navigationService.navigateWithTransition(const SingnupView(),
          routeName: Routes.singnupView,
          transitionStyle: Transition.rightToLeft);
    }
  }
}
