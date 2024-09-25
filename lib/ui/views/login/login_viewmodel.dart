import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:servant_industry_hiring/services/fire_service.dart';
import 'package:servant_industry_hiring/ui/common/apihelpers/apihelper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';
import 'package:servant_industry_hiring/ui/views/admin/admin_view.dart';
import 'package:servant_industry_hiring/ui/views/hire/hire_view.dart';
import 'package:servant_industry_hiring/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/sharedpref_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _fireService = locator<FireService>();
  final _sharedpref = locator<SharedprefService>();

  TextEditingController phone = MaskedTextController(mask: '0000-0000000');
  TextEditingController pass = TextEditingController();

  void login(BuildContext context) {
    if (phone.text.isEmpty || pass.text.isEmpty) {
      show_snackbar(context, "allfields");
    } else if (phone.text == "0000-0000000" && pass.text == "admin") {
      _sharedpref.setString('phone', phone.text);
      _sharedpref.setString('name', "admin");
      _navigationService.clearStackAndShow(Routes.adminView);
      _navigationService.replaceWithTransition(const AdminView(),
          routeName: Routes.adminView, transitionStyle: Transition.rightToLeft);
    } else {
      displayprogress(context);
      var result = _fireService.messaging.getToken().then((value) {
        return ApiHelper.login(
            phone.text, pass.text, value.toString(), context);
      });
      result.then((value) {
        String cat = value['user']['cat'] ?? "";
        String status = value['user']['status'] ?? "";

        if (status == "true") {
          _sharedpref.setString('name', value['user']['name']);
          _sharedpref.setString('cnic', value['user']['cnic']);
          _sharedpref.setString('phone', phone.text);
          _sharedpref.setString('address', value['user']['address']);
          _sharedpref.setString('age', value['user']['age']);
          _sharedpref.setString('gender', value['user']['gender']);
          _sharedpref.setString('cat', cat);
          _sharedpref.setString('img', value['user']['img']);
          _sharedpref.setString('deviceid', value['user']['img']);

          _sharedpref.setString("fathername", value['user']['fathername']);
          _sharedpref.setString("experience", value['user']['experience']);
          _sharedpref.setString("pvcname", value['user']['pvcname']);
          _sharedpref.setString("pvcnumber", value['user']['pvcnumber']);
          _sharedpref.setString("pvcimg", value['user']['pvcdoc']);
          _sharedpref.setString("servantcat", value['user']['servantcat']);

          _sharedpref.setString("auth", 'true');
          hideprogress(context);

          if (cat == 'hire') {
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
        } else {
          hideprogress(context);
          show_snackbar(context, "Wait for admin approval");
        }
      });
    }
  }
}
