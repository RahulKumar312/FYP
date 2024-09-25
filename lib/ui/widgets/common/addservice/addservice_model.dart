import 'package:flutter/cupertino.dart';
import 'package:servant_industry_hiring/ui/common/apihelpers/apihelper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/snakbar_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/sharedpref_service.dart';

class AddserviceModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController duration = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();

  bool update = false;
  void first(Map data) {
    if (data.isEmpty) {
      update = false;
    } else {
      update = true;
      duration.text = data['duration'];
      price.text = data['price'];
      title.text = data['title'];
      des.text = data['des'];
      intialf = data['frequency'];
    }
  }

  Future<void> delete(Map data, BuildContext context) async {
    displayprogress(context);
    await ApiHelper.deleteservice(data['_id'], context);
    hideprogress(context);
    back();
  }

  Future<void> addservice(BuildContext context, Map data) async {
    if (duration.text.isEmpty ||
        price.text.isEmpty ||
        title.text.isEmpty ||
        des.text.isEmpty) {
      show_snackbar(context, "allfields");
    } else {
      displayprogress(context);
      late bool check;
      if (update) {
        check = await ApiHelper.updatedgrapher(
            data['_id'],
            title.text,
            des.text,
            duration.text,
            price.text,
            intialf,
            sharedpref.readString("servantcat"),
            context);
      } else {
        check = await ApiHelper.registerservice(
            sharedpref.readString('phone'),
            title.text,
            des.text,
            duration.text,
            price.text,
            intialf,
            sharedpref.readString("servantcat"),
            context);
      }
      if (check) {
        hideprogress(context);
        back();
      } else {
        hideprogress(context);
      }
    }
  }

  String intialf = 'Daily';
  List<String> frequency = ['Daily', "Weekly", "Monthly"];

  void back() {
    _navigationService.back();
  }
}
