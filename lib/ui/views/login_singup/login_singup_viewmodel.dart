import 'package:servant_industry_hiring/ui/views/categoryslector/categoryslector_view.dart';
import 'package:servant_industry_hiring/ui/views/login/login_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class LoginSingupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  bool check = true;

  void first() {
    if (check) {
      _dialogService
          .showCustomDialog(
        variant: DialogType.infoAlert,
      )
          .then((value) {
        notifyListeners();
        check = false;
      });
    }
  }

  void login() {
    _navigationService.navigateWithTransition(const LoginView(),
        routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
  }

  void signup() {
    _navigationService.navigateWithTransition(const CategoryslectorView(),
        routeName: Routes.categoryslectorView,
        transitionStyle: Transition.rightToLeft);
  }
}
