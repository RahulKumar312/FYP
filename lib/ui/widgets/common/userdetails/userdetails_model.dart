import 'package:flutter/cupertino.dart';
import 'package:servant_industry_hiring/ui/views/chat/allchat/allchat_view.dart';
import 'package:servant_industry_hiring/ui/views/wallet/wallet_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/localizationhelper/localization_checker.dart';
import '../../../views/login_singup/login_singup_view.dart';

class UserdetailsModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  void logout() {
    sharedpref.setString('auth', 'false');
    sharedpref.remove('name');
    sharedpref.remove('cnic');
    sharedpref.remove('phone');
    sharedpref.remove('address');
    sharedpref.remove('age');
    sharedpref.remove('gender');
    sharedpref.remove('cat');
    sharedpref.remove('img');
    sharedpref.remove('deviceid');
    sharedpref.remove("fathername");
    sharedpref.remove("experience");
    sharedpref.remove("pvcname");
    sharedpref.remove("pvcnumber");
    sharedpref.remove("pvcimg");
    sharedpref.remove("servantcat");
    _navigationService.clearStackAndShow(Routes.loginSingupView);
    _navigationService.replaceWithTransition(const LoginSingupView(),
        routeName: Routes.loginSingupView,
        transitionStyle: Transition.rightToLeft);
  }

  void language(BuildContext context) {
    LocalizationChecker.changeLanguge(context);
  }

  void wallet() {
    _navigationService.navigateWithTransition(const WalletView(),
        routeName: Routes.walletView, transitionStyle: Transition.rightToLeft);
  }

  void allchats() {
    _navigationService.navigateWithTransition(const AllchatView(),
        routeName: Routes.walletView, transitionStyle: Transition.rightToLeft);
  }
}
