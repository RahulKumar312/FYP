import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_veiw_helper.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';
import '../../widgets/common/loginsignuptop/loginsignuptop.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Loginsignuptop(
                text: "Login",
              ),
              verticalSpaceSmall,
              Container(
                decoration: BoxDecoration(
                    color: getColorWithOpacity(kcLightGrey, 0.1),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsetsDirectional.all(10),
                padding: const EdgeInsetsDirectional.all(10),
                child: Column(
                  children: [
                    text_view_helper(
                      hint: "EnterPhone",
                      controller: viewModel.phone,
                      showicon: true,
                      textInputType: TextInputType.phone,
                      maxlength: 11,
                      formatter: [
                        FilteringTextInputFormatter.allow(getRegExpint())
                      ],
                      icon: const Icon(Icons.phone),
                    )
                        .animate(delay: 500.milliseconds)
                        .fade()
                        .moveY(begin: 50, end: 0),
                    text_view_helper(
                      hint: "EnterPassword",
                      controller: viewModel.pass,
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
                      onpress: () => viewModel.login(context),
                      color: kcPrimaryColor,
                      width: screenWidthCustom(context, 0.4),
                      child: text_helper(
                          data: "Login",
                          font: poppins,
                          color: white,
                          bold: true,
                          size: fontSize14))
                  .animate(delay: 900.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0)
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
