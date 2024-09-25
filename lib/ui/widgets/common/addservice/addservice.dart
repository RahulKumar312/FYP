import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/uihelper/text_veiw_helper.dart';
import 'addservice_model.dart';

class Addservice extends StackedView<AddserviceModel> {
  Addservice({super.key, required this.data});
  Map data;

  @override
  Widget builder(
    BuildContext context,
    AddserviceModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: screenWidth(context),
      height: screenHeightCustom(context, 0.95),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  text_helper(
                    data: "AddService",
                    font: poppins,
                    color: kcDarkGreyColor,
                    size: fontSize20,
                    bold: true,
                  ),
                  InkWell(
                    onTap: () => viewModel.back(),
                    child: Container(
                      padding: const EdgeInsetsDirectional.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1, color: kcDarkGreyColor)),
                      child: const Icon(Icons.close),
                    ),
                  )
                ],
              ),
            ).animate(delay: 500.milliseconds).fade().moveY(begin: 50, end: 0),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsetsDirectional.all(10),
              margin: const EdgeInsetsDirectional.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: getColorWithOpacity(kcLightGrey, 0.1)),
              child: Column(
                children: [
                  text_view_helper(
                    hint: "EnterTitle",
                    controller: viewModel.title,
                    showicon: true,
                    icon: const Icon(Icons.title),
                    formatter: [
                      FilteringTextInputFormatter.allow(getRegExpstring())
                    ],
                  )
                      .animate(delay: 700.milliseconds)
                      .fade()
                      .moveY(begin: 50, end: 0),
                  text_view_helper(
                    hint: "EnterDescription",
                    controller: viewModel.des,
                    showicon: true,
                    maxline: null,
                    icon: const Icon(Icons.description),
                  )
                      .animate(delay: 900.milliseconds)
                      .fade()
                      .moveY(begin: 50, end: 0),
                  text_view_helper(
                    hint: "EnterDurationinminutes",
                    controller: viewModel.duration,
                    showicon: true,
                    icon: const Icon(Icons.timer),
                    textInputType: TextInputType.number,
                    formatter: [
                      FilteringTextInputFormatter.allow(getRegExpint())
                    ],
                  )
                      .animate(delay: 1100.milliseconds)
                      .fade()
                      .moveY(begin: 50, end: 0),
                  text_view_helper(
                    hint: "EnterPrice",
                    controller: viewModel.price,
                    showicon: true,
                    icon: const Icon(Icons.currency_exchange),
                    textInputType: TextInputType.number,
                    formatter: [
                      FilteringTextInputFormatter.allow(getRegExpint())
                    ],
                  )
                      .animate(delay: 1300.milliseconds)
                      .fade()
                      .moveY(begin: 50, end: 0),
                  Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsetsDirectional.all(5),
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        text_helper(
                            data: "selectfrequency",
                            font: poppins,
                            bold: true,
                            color: kcDarkGreyColor,
                            size: fontSize12),
                        DropdownButton<String>(
                          value: viewModel.intialf,
                          icon: const Row(
                            children: [
                              horizontalSpaceSmall,
                              Icon(
                                Icons.arrow_downward,
                                color: kcDarkGreyColor,
                              ),
                            ],
                          ),
                          style: text_helper.customstyle(poppins,
                              kcDarkGreyColor, fontSize12, context, false),
                          onChanged: (String? newValue) {
                            viewModel.intialf = newValue!;
                            viewModel.notifyListeners();
                          },
                          items: viewModel.frequency
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: text_helper(
                                  data: value,
                                  font: poppins,
                                  color: kcDarkGreyColor,
                                  size: fontSize12),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                      .animate(delay: 1500.milliseconds)
                      .fade()
                      .moveY(begin: 50, end: 0),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                viewModel.update
                    ? button_helper(
                            onpress: () => viewModel.delete(data, context),
                            color: red,
                            width: screenWidthCustom(context, 0.4),
                            child: text_helper(
                                data: 'delete',
                                font: poppins,
                                bold: true,
                                color: white,
                                size: fontSize14))
                        .animate(delay: 1700.milliseconds)
                        .fade()
                        .moveY(begin: 50, end: 0)
                    : const SizedBox.shrink(),
                button_helper(
                        onpress: () => viewModel.addservice(context, data),
                        color: kcPrimaryColor,
                        width: screenWidthCustom(context, 0.4),
                        child: text_helper(
                            data: viewModel.update
                                ? "updateservice"
                                : "AddService",
                            font: poppins,
                            bold: true,
                            color: white,
                            size: fontSize14))
                    .animate(delay: 1700.milliseconds)
                    .fade()
                    .moveY(begin: 50, end: 0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(AddserviceModel viewModel) => viewModel.first(data);

  @override
  AddserviceModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddserviceModel();
}
