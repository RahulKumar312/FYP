import 'package:servant_industry_hiring/services/sharedpref_service.dart';
import 'package:stacked/stacked.dart';
import 'package:servant_industry_hiring/app/app.locator.dart';
import 'package:servant_industry_hiring/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../hire/hire_view.dart';
import '../home/home_view.dart';
import '../login_singup/login_singup_view.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedpref = locator<SharedprefService>();

  Future runStartupLogic() async {
    _sharedpref.initialize();
    await Future.delayed(const Duration(seconds: 3));
    if (!_sharedpref.contains('auth') ||
        _sharedpref.readString('auth') != 'true') {
      _navigationService.replaceWithTransition(const LoginSingupView(),
          routeName: Routes.loginSingupView,
          transitionStyle: Transition.rightToLeft);
    } else {
      if (_sharedpref.readString('cat') == 'hire') {
        _navigationService.clearStackAndShow(Routes.hireView);
        _navigationService.replaceWithTransition(const HireView(),
            routeName: Routes.hireView,
            transitionStyle: Transition.rightToLeft);
      } else {
        _navigationService.clearStackAndShow(Routes.homeView);
        _navigationService.replaceWithTransition(const HomeView(),
            routeName: Routes.homeView,
            transitionStyle: Transition.rightToLeft);
      }
    }
  }
}
