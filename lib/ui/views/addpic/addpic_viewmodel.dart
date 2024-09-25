// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servant_industry_hiring/ui/views/addpass/addpass_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/sharedpref_service.dart';
import '../../common/apihelpers/firebsaeuploadhelper.dart';
import '../../common/uihelper/snakbar_helper.dart';

class AddpicViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedpref = locator<SharedprefService>();

  File? image;

  Future<void> pic() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> next(BuildContext context) async {
    if (image == null) {
      show_snackbar(context, "addpic");
    } else {
      displayprogress(context);
      String url = await FirebaseHelper.uploadFile(
          image, _sharedpref.readString('phone'));
      _sharedpref.setString('img', url);
      hideprogress(context);
      _navigationService.navigateWithTransition(const AddpassView(),
          routeName: Routes.addpassView,
          transitionStyle: Transition.rightToLeft);
    }
  }
}
