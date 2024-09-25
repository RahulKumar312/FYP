import 'package:flutter/material.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'info_alert_dialog_model.dart';

class InfoAlertDialog extends StackedView<InfoAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const InfoAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InfoAlertDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            text_helper(
              data: "Select Language",
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize18,
              bold: true,
            ),
            button_helper(
                onpress: () => viewModel.english(context),
                color: kcPrimaryColor,
                width: screenWidth(context),
                child: text_helper(
                    data: "English",
                    font: poppins,
                    color: white,
                    size: fontSize14)),
            button_helper(
                onpress: () => viewModel.urdu(context),
                color: kcPrimaryColor,
                width: screenWidth(context),
                child: text_helper(
                    data: "اردو",
                    font: poppins,
                    color: white,
                    size: fontSize14)),
          ],
        ),
      ),
    );
  }

  @override
  InfoAlertDialogModel viewModelBuilder(BuildContext context) =>
      InfoAlertDialogModel();
}
