import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/sharedpref_service.dart';

class HomeViewModel extends BaseViewModel {
  final sharedpref = locator<SharedprefService>();

  int currentindex = 0;
  final List<Tab> tabs = [
    const Tab(
      icon: Icon(Icons.window),
    ),
    const Tab(
      icon: Icon(Icons.border_color_outlined),
    ),
    const Tab(
      icon: Icon(Icons.analytics),
    ),
  ];
}
