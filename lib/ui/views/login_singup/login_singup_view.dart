import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';
import '../../widgets/common/loginsignuptop/loginsignuptop.dart';
import 'login_singup_viewmodel.dart';

class LoginSingupView extends StackedView<LoginSingupViewModel> {
  const LoginSingupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginSingupViewModel viewModel,
    Widget? child,
  ) {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      viewModel.first();
    });
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              Loginsignuptop(
                text: "homecare".tr(),
              ),
              verticalSpaceLarge,
              Image.asset('assets/login.jpg')
                  .animate(delay: 500.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0),
              verticalSpaceLarge,
              text_helper(
                      data: "Hello",
                      font: poppins,
                      color: kcDarkGreyColor,
                      size: fontSize28,
                      bold: true)
                  .animate(delay: 800.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: text_helper(
                        data: "welcometext",
                        font: poppins,
                        color: kcLightGrey,
                        size: fontSize14,
                        bold: false)
                    .animate(delay: 800.milliseconds)
                    .fade()
                    .moveY(begin: 50, end: 0),
              ),
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button_helper(
                    onpress: () => viewModel.login(),
                    color: kcPrimaryColor,
                    width: screenWidthCustom(context, 0.35),
                    raduis: 50,
                    border: Border.all(width: 2, color: kcPrimaryColor),
                    child: text_helper(
                        data: "Login",
                        font: poppins,
                        color: white,
                        size: fontSize18),
                  ),
                  button_helper(
                    onpress: () => viewModel.signup(),
                    color: white,
                    width: screenWidthCustom(context, 0.35),
                    border: Border.all(width: 2, color: kcDarkGreyColor),
                    raduis: 50,
                    child: text_helper(
                        data: "SingUp",
                        font: poppins,
                        color: kcDarkGreyColor,
                        size: fontSize18),
                  ),
                ],
              )
                  .animate(delay: 1300.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0),
            ],
          ),
        ));
  }

  Future<void> permission() async {
    await Permission.notification.request();
  }

  @override
  void onViewModelReady(LoginSingupViewModel viewModel) {
    permission();
  }

  @override
  LoginSingupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginSingupViewModel();
}
