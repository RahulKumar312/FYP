import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/widgets/common/homedetails/homedetails.dart';
import 'package:servant_industry_hiring/ui/widgets/common/orders/orders.dart';
import 'package:servant_industry_hiring/ui/widgets/common/services/services.dart';
import 'package:stacked/stacked.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../common/ui_helpers.dart';
import 'hire_viewmodel.dart';

class HireView extends StackedView<HireViewModel> {
  const HireView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HireViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(child: bodyContainer(viewModel, context)),
      bottomNavigationBar: SalomonBottomBar(
          backgroundColor: amber,
          selectedColorOpacity: 1,
          currentIndex: viewModel.currentIndex,
          onTap: (i) => viewModel.updateindex(i),
          items: viewModel.bottomcontents),
    );
  }

  Widget bodyContainer(HireViewModel viewModel, BuildContext context) {
    Widget screen = const Homedetails();
    switch (viewModel.currentIndex) {
      case 0:
        screen =
            const Homedetails().animate().fadeIn(duration: 500.milliseconds);
        break;
      case 1:
        screen = Services().animate().fadeIn(duration: 500.milliseconds);
        break;
      case 2:
        screen = Orders().animate().fadeIn(duration: 500.milliseconds);
        break;
    }

    return SizedBox(
      width: screenWidth(context),
      height: screenHeight(context),
      child: Center(child: screen),
    );
  }

  @override
  HireViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HireViewModel();
}
