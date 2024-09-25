import 'package:flutter/cupertino.dart';
import 'package:servant_industry_hiring/ui/views/plans/plans_view.dart';
import 'package:servant_industry_hiring/ui/views/showusers/showusers_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';

class HomedetailsModel extends BaseViewModel {
  final sharedpref = locator<SharedprefService>();
  final navService = locator<NavigationService>();

  TextEditingController search = TextEditingController();

  List cat = [
    {'name': 'cook', 'img': 'assets/cook.png'},
    {'name': 'gardner', 'img': 'assets/gardner.png'},
    {'name': 'sweaper', 'img': 'assets/sweaper.png'},
    {'name': 'babysitter', 'img': 'assets/baby sitter.png'}
  ];

  void nav(String cat) {
    navService.navigateWithTransition(ShowusersView(cat: cat),
        transitionStyle: Transition.leftToRight,
        routeName: Routes.showusersView);
  }

  void plan() {
    navService.navigateWithTransition(const PlansView(),
        transitionStyle: Transition.leftToRight,
        routeName: Routes.showusersView);
  }
}
