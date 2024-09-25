// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:stacked/stacked.dart';

import 'loginsignuptop_model.dart';

class Loginsignuptop extends StackedView<LoginsignuptopModel> {
  Loginsignuptop({super.key, required this.text});
  String text;

  @override
  Widget builder(
    BuildContext context,
    LoginsignuptopModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: screenWidth(context),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            'assets/servanttopicon.png',
            width: screenWidthCustom(context, 0.1),
            height: screenWidthCustom(context, 0.1),
          ).animate(delay: 500.milliseconds).fade().scale().shake(),
          horizontalSpaceMedium,
          text_helper(
                  data: text,
                  font: poppins,
                  color: kcDarkGreyColor,
                  size: fontSize18,
                  bold: true)
              .animate(delay: 500.milliseconds)
              .fade()
              .moveX()
        ],
      ),
    );
  }

  @override
  LoginsignuptopModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginsignuptopModel();
}
