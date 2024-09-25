import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../common/uihelper/button_helper.dart';
import '../../common/uihelper/text_helper.dart';
import '../../common/uihelper/text_veiw_helper.dart';
import '../../widgets/common/loginsignuptop/loginsignuptop.dart';
import 'addpass_viewmodel.dart';

class AddpassView extends StackedView<AddpassViewModel> {
  const AddpassView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddpassViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              Loginsignuptop(text: "addpass"),
              verticalSpaceSmall,
              Container(
                padding: const EdgeInsetsDirectional.all(10),
                margin: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                    color: getColorWithOpacity(kcLightGrey, 0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    text_view_helper(
                      hint: "EnterPassword",
                      controller: viewModel.pass,
                      showicon: true,
                      obsecure: true,
                      icon: const Icon(Icons.password),
                    )
                        .animate(delay: 500.milliseconds)
                        .fade()
                        .moveY(begin: 50, end: 0),
                    text_view_helper(
                      hint: "ConfirmPassword",
                      controller: viewModel.conpass,
                      showicon: true,
                      obsecure: true,
                      icon: const Icon(Icons.password),
                    )
                        .animate(delay: 700.milliseconds)
                        .fade()
                        .moveY(begin: 50, end: 0),
                  ],
                ),
              ),
              button_helper(
                      onpress: () => viewModel.next(context),
                      color: kcPrimaryColor,
                      width: screenWidthCustom(context, 0.6),
                      raduis: 10,
                      padding: const EdgeInsetsDirectional.all(8),
                      child: text_helper(
                        data: "makeaccount",
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
  AddpassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddpassViewModel();
}
