import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../login_singup/login_singup_view.dart';
import '../wallet/wallet_view.dart';

class AdminViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void logout() {
    _navigationService.clearStackAndShow(Routes.loginSingupView);
    _navigationService.replaceWithTransition(const LoginSingupView(),
        routeName: Routes.loginSingupView,
        transitionStyle: Transition.rightToLeft);
  }

  void wallet() {
    _navigationService.navigateWithTransition(const WalletView(),
        routeName: Routes.walletView, transitionStyle: Transition.rightToLeft);
  }
}
