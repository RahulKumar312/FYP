// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:servant_industry_hiring/ui/common/apihelpers/apihelper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';
import 'package:servant_industry_hiring/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/fire_service.dart';
import '../../../services/sharedpref_service.dart';
import '../hire/hire_view.dart';

class AddpassViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedpref = locator<SharedprefService>();
  final _fireService = locator<FireService>();

  TextEditingController pass = TextEditingController();
  TextEditingController conpass = TextEditingController();

  void next(BuildContext context) {
    if (pass.text.isEmpty || conpass.text.isEmpty) {
      show_snackbar(context, "allfields");
    } else if (pass.text != conpass.text) {
      show_snackbar(context, "passandconfirmpassdonotmatch");
    } else {
      displayprogress(context);
      Future<bool> result = _fireService.messaging.getToken().then((value) {
        _sharedpref.setString('deviceid', value.toString());
        return ApiHelper.registration(
          _sharedpref.readString('name'),
          _sharedpref.readString('cnic'),
          _sharedpref.readString('phone'),
          _sharedpref.readString('address'),
          _sharedpref.readString('age'),
          _sharedpref.readString('gender'),
          _sharedpref.readString('cat'),
          _sharedpref.readString('img'),
          pass.text,
          value.toString(),
          _sharedpref.readString('fathername'),
          _sharedpref.readString('experience'),
          _sharedpref.readString('pvcname'),
          _sharedpref.readString('pvcnumber'),
          _sharedpref.readString('pvcimg'),
          _sharedpref.readString("servantcat"),
          _sharedpref.readString('cat') == 'hire' ? "true" : "false",
          context,
        );
      });
      _sharedpref.setString("auth", 'true');
      result.then((value) async {
        if (value) {
          await ApiHelper.registerwallet(
              _sharedpref.readString('phone'), context);
          hideprogress(context);
          String cat = _sharedpref.readString("cat");
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
        }
      });
    }
  }
}
