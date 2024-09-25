// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class OtpViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();
  // final _fireService = locator<FireService>();

  TextEditingController otp = TextEditingController();
  String verficationid = '';

  Future<void> next(BuildContext context) async {
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: verficationid, smsCode: otp.text);
    // var check = await _fireService.auth.signInWithCredential(credential);
    // if (check.additionalUserInfo!.isNewUser) {
    //   _navigationService.navigateWithTransition(const CategoryslectorView(),
    //       routeName: Routes.categoryslectorView,
    //       transitionStyle: Transition.rightToLeft);
    // } else {
    //   show_snackbar(context, "alreadyregisteredgotologin");
    //   _navigationService.back();
    // }
  }

  void first(String v) {
    verficationid = v;
  }
}
