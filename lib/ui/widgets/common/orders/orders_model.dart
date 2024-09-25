import 'package:servant_industry_hiring/ui/common/apihelpers/apihelper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/sharedpref_service.dart';

class OrdersModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  String val = "all";

  Future<void> cancel(String id, String status) async {
    bool c = await ApiHelper.bookingupdatestatus(id, status);
    notifyListeners();
  }
}
