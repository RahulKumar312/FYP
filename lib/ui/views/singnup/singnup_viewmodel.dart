import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:servant_industry_hiring/ui/common/apihelpers/firebsaeuploadhelper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';
import 'package:servant_industry_hiring/ui/views/addpic/addpic_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/sharedpref_service.dart';

class SingnupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final _fireService = locator<FireService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController name = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController phone = MaskedTextController(mask: '0000-0000000');
  TextEditingController cnic = MaskedTextController(mask: '00000-0000000-0');
  TextEditingController address = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController kamwala = TextEditingController();
  TextEditingController pcvname = TextEditingController();
  TextEditingController pcvnumber = TextEditingController();

  Future<void> next(BuildContext context) async {
    if (sharedpref.readString('cat') == 'servant') {
      servant(context);
    } else {
      notservant(context);
    }
  }

  Future<void> servant(BuildContext context) async {
    if (name.text.isEmpty ||
        fathername.text.isEmpty ||
        age.text.isEmpty ||
        cnic.text.isEmpty ||
        pcvnumber.text.isEmpty ||
        pcvname.text.isEmpty ||
        phone.text.isEmpty ||
        intalcat == '' ||
        address.text.isEmpty) {
      show_snackbar(context, "allfields");
    } else if (phone.text.toString().length != 12) {
      show_snackbar(context, "checkmobilenumber");
    } else if (cnic.text.toString().length != 15) {
      show_snackbar(context, "cnicshouldbe13digitlongwithoutdash");
    } else {
      displayprogress(context);
      String url =
          await FirebaseHelper.uploadFile(File(file!.path!), phone.text);

      sharedpref.setString("name", name.text);
      sharedpref.setString("cnic", cnic.text);
      sharedpref.setString("phone", phone.text);
      sharedpref.setString("address", address.text);
      sharedpref.setString("age", age.text);
      sharedpref.setString("gender", selectedgender);
      sharedpref.setString("fathername", fathername.text);
      sharedpref.setString("experience", selectedExperience);
      sharedpref.setString('servantcat', intalcat);
      sharedpref.setString("pvcname", pcvname.text);
      sharedpref.setString("pvcnumber", pcvnumber.text);
      sharedpref.setString("pvcimg", url);

      hideprogress(context);
      _navigationService.navigateWithTransition(const AddpicView(),
          routeName: Routes.addpicView,
          transitionStyle: Transition.rightToLeft);
    }
  }

  void notservant(BuildContext context) {
    if (name.text.isEmpty ||
        cnic.text.isEmpty ||
        phone.text.isEmpty ||
        address.text.isEmpty) {
      show_snackbar(context, "allfields");
    } else if (phone.text.toString().length != 12) {
      show_snackbar(context, "checkmobilenumber");
    } else if (cnic.text.toString().length != 15) {
      show_snackbar(context, "cnicshouldbe13digitlongwithoutdash");
    } else {
      displayprogress(context);

      sharedpref.setString("name", name.text);
      sharedpref.setString("cnic", cnic.text);
      sharedpref.setString("phone", phone.text);
      sharedpref.setString("address", address.text);
      sharedpref.setString("age", age.text);
      sharedpref.setString("gender", selectedgender);
      sharedpref.setString("fathername", '');
      sharedpref.setString("experience", '');
      sharedpref.setString("pvcname", '');
      sharedpref.setString("pvcnumber", '');
      sharedpref.setString('servantcat', '');
      sharedpref.setString("pvcimg", '');
      hideprogress(context);
      // await _fireService.auth.verifyPhoneNumber(
      //   phoneNumber: '+92${phone.text.toString().substring(1)}',
      //   verificationCompleted: (PhoneAuthCredential credential) async {
      //     await _fireService.auth.signInWithCredential(credential);
      //   },
      //   verificationFailed: (FirebaseAuthException e) {
      //     hideprogress(context);
      //     show_snackbar(context, "tryagainlater");
      //   },
      //   codeSent: (String verificationId, int? resendToken) async {
      //     hideprogress(context);
      //
      //     _navigationService.navigateWithTransition(
      //         OtpView(
      //           id: verificationId,
      //         ),
      //         routeName: Routes.otpView,
      //         transitionStyle: Transition.rightToLeft);
      //   },
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );
      _navigationService.navigateWithTransition(const AddpicView(),
          routeName: Routes.addpicView,
          transitionStyle: Transition.rightToLeft);
    }
  }

  PlatformFile? file;
  Future<void> uploadcert() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      file = result.files.single;
      notifyListeners();
    }
  }

  String intalcat = '';
  List cat = [
    {'name': 'cook', 'img': 'assets/cook.png'},
    {'name': 'gardner', 'img': 'assets/gardner.png'},
    {'name': 'sweaper', 'img': 'assets/sweaper.png'},
    {'name': 'babysitter', 'img': 'assets/baby sitter.png'}
  ];

  String selectedExperience = 'Beginner';
  final List<String> experienceLevels = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];

  String selectedgender = 'male';
  final List<String> gender = [
    'male',
    'female',
  ];
}
