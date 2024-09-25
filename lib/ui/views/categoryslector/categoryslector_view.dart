import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:servant_industry_hiring/ui/widgets/common/loginsignuptop/loginsignuptop.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'categoryslector_viewmodel.dart';

class CategoryslectorView extends StackedView<CategoryslectorViewModel> {
  const CategoryslectorView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CategoryslectorViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              Loginsignuptop(text: "categoryselector"),
              verticalSpaceSmall,
              button_helper(
                      onpress: () => viewModel.hire(),
                      color: white,
                      width: screenWidth(context),
                      margin: const EdgeInsetsDirectional.all(10),
                      padding: const EdgeInsetsDirectional.all(10),
                      raduis: 10,
                      boxshadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                            color: viewModel.cat == "hire"
                                ? getColorWithOpacity(kcPrimaryColor, 0.5)
                                : getColorWithOpacity(kcLightGrey, 0.3))
                      ],
                      child: Row(
                        children: [
                          SizedBox(
                              width: screenWidthCustom(context, 0.1),
                              height: screenWidthCustom(context, 0.1),
                              child: Image.asset('assets/hire.png')),
                          horizontalSpaceSmall,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text_helper(
                                  data: 'wanttohire',
                                  font: poppins,
                                  color: kcDarkGreyColor,
                                  size: fontSize20,
                                  bold: true,
                                ),
                                text_helper(
                                  data: 'wanttohiredes',
                                  font: poppins,
                                  textAlign: TextAlign.start,
                                  color: kcMediumGrey,
                                  size: fontSize12,
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                  .animate(delay: 500.milliseconds)
                  .fade()
                  .moveX(begin: -100, end: 0),
              button_helper(
                      onpress: () => viewModel.buy(),
                      color: white,
                      width: screenWidth(context),
                      margin: const EdgeInsetsDirectional.all(10),
                      padding: const EdgeInsetsDirectional.all(10),
                      raduis: 10,
                      boxshadow: [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: const Offset(0, 0),
                            color: viewModel.cat == "servant"
                                ? getColorWithOpacity(kcPrimaryColor, 0.5)
                                : getColorWithOpacity(kcLightGrey, 0.3))
                      ],
                      child: Row(
                        children: [
                          SizedBox(
                              width: screenWidthCustom(context, 0.1),
                              height: screenWidthCustom(context, 0.1),
                              child: Image.asset('assets/servant.png')),
                          horizontalSpaceSmall,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text_helper(
                                  data: 'workasservant',
                                  font: poppins,
                                  color: kcDarkGreyColor,
                                  size: fontSize20,
                                  bold: true,
                                ),
                                text_helper(
                                  data: 'workasservantdes',
                                  font: poppins,
                                  textAlign: TextAlign.start,
                                  color: kcMediumGrey,
                                  size: fontSize12,
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                  .animate(delay: 700.milliseconds)
                  .fade()
                  .moveX(begin: -100, end: 0),
              verticalSpaceSmall,
              button_helper(
                      onpress: () => viewModel.next(context),
                      color: kcPrimaryColor,
                      width: screenWidthCustom(context, 0.5),
                      raduis: 10,
                      padding: const EdgeInsetsDirectional.all(8),
                      child: text_helper(
                        data: "next",
                        font: poppins,
                        color: white,
                        size: fontSize18,
                        bold: true,
                      ))
                  .animate(delay: 900.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0),
            ],
          ),
        ));
  }

  @override
  CategoryslectorViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CategoryslectorViewModel();
}
