import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';

import '../../common/app_strings.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: screenWidthCustom(context, 0.4),
                  height: screenWidthCustom(context, 0.4),
                  child: Lottie.asset('assets/splashanim.json')),
              text_helper(
                  data: "homecare",
                  font: montserrat,
                  color: kcPrimaryColor,
                  size: fontSize26,
                  bold: true)
            ],
          ),
        )));
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
