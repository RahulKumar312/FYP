import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import '../../widgets/common/loginsignuptop/loginsignuptop.dart';
import 'addpic_viewmodel.dart';

class AddpicView extends StackedView<AddpicViewModel> {
  const AddpicView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddpicViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Loginsignuptop(text: "addpic"),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsetsDirectional.all(10),
                child: text_helper(
                  data: "picnote",
                  font: montserrat,
                  color: red,
                  bold: true,
                  textAlign: TextAlign.start,
                  size: fontSize12,
                ),
              )
                  .animate(delay: 500.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0),
              viewModel.image == null
                  ? InkWell(
                      onTap: () => viewModel.pic(),
                      child: Icon(
                        Icons.person,
                        size: screenWidthCustom(context, 0.5),
                      )
                          .animate(delay: 700.milliseconds)
                          .fade()
                          .moveY(begin: 50, end: 0),
                    )
                  : InkWell(
                      onTap: () => viewModel.pic(),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            viewModel.image!,
                            fit: BoxFit.cover,
                            width: screenWidth(context),
                            height: screenWidth(context),
                          ),
                        ),
                      )
                          .animate(delay: 700.milliseconds)
                          .fade()
                          .moveY(begin: 50, end: 0),
                    ),
              button_helper(
                      onpress: () => viewModel.next(context),
                      color: kcPrimaryColor,
                      width: screenWidthCustom(context, 0.3),
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
        ),
      ),
    );
  }

  @override
  AddpicViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddpicViewModel();
}
