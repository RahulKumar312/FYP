import 'package:flutter/material.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:stacked/stacked.dart';

import '../../common/apihelpers/apihelper.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../common/uihelper/snakbar_helper.dart';
import '../../common/uihelper/text_helper.dart';
import 'plans_viewmodel.dart';

class PlansView extends StackedView<PlansViewModel> {
  const PlansView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PlansViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade50,
          leading: const SizedBox.shrink(),
        ),
        backgroundColor: Colors.amber.shade50,
        body: SafeArea(
            child: FutureBuilder(
          future: ApiHelper.findone(
              viewModel.sharedpref.readString("phone").toString()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_helper(
                          data: "Subscription Plans",
                          font: poppins,
                          color: kcDarkGreyColor,
                          size: fontSize24,
                          bold: true,
                        ),
                        text_helper(
                          data: snapshot.data['plans'] == "0"
                              ? "You have No Plan"
                              : snapshot.data['plans'] == "1"
                                  ? "You have Basic"
                                  : snapshot.data['plans'] == "2"
                                      ? "You have Premium"
                                      : "You have Platinum",
                          font: poppins,
                          color: kcDarkGreyColor,
                          size: fontSize14,
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceMedium,
                  FutureBuilder(
                    future: ApiHelper.alladmin(),
                    builder: (BuildContext context, AsyncSnapshot snapshot2) {
                      if (snapshot2.hasData) {
                        return SizedBox(
                          width: screenWidth(context),
                          height: screenHeightCustom(context, 0.5),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              t(
                                  context,
                                  viewModel,
                                  "Basic",
                                  "4",
                                  "Normal Speed",
                                  snapshot2.data[0]['basic'],
                                  "1"),
                              t(
                                  context,
                                  viewModel,
                                  "Premium",
                                  "7",
                                  "Medium Speed",
                                  snapshot2.data[0]['pre'],
                                  "2"),
                              t(context, viewModel, "Platinum", "10",
                                  "Fast Speed", snapshot2.data[0]['plat'], "3"),
                            ],
                          ),
                        );
                      } else if (snapshot2.hasError) {
                        return const Icon(
                          Icons.error,
                          color: kcDarkGreyColor,
                        );
                      } else {
                        return displaysimpleprogress(context);
                      }
                    },
                  ),
                  verticalSpaceSmall,
                  button_helper(
                      onpress: () => viewModel.changeplan(context),
                      color: amber,
                      width: screenWidth(context),
                      child: text_helper(
                          data: "OK",
                          font: poppins,
                          bold: true,
                          color: kcDarkGreyColor,
                          size: fontSize14))
                ],
              );
            } else if (snapshot.hasError) {
              return const Icon(
                Icons.error,
                color: kcDarkGreyColor,
              );
            } else {
              return displaysimpleprogress(context);
            }
          },
        )));
  }

  Widget t(BuildContext context, PlansViewModel viewModel, String title,
      String b1, String b2, String price, String p) {
    return InkWell(
      onTap: () {
        viewModel.price = price;
        viewModel.plan = p;
        viewModel.nbook = b1;
        viewModel.notifyListeners();
      },
      child: Container(
        width: screenWidthCustom(context, 0.5),
        height: screenHeightCustom(context, 0.4),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(3, 3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: viewModel.plan == p
                      ? getColorWithOpacity(kcDarkGreyColor, 0.3)
                      : Colors.transparent)
            ],
            gradient: const LinearGradient(
                colors: [Color(0xFFff6e7f), Color(0xFFbfe9ff)])),
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              child: Opacity(
                opacity: 0.4,
                child: text_helper(
                    data: "100", font: poppins, color: white, size: 140),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 130,
                  height: 70,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          colors: [Color(0xFFbfe9ff), Color(0xFFff6e7f)])),
                  child: Container(
                    width: 130,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), color: white),
                    child: Container(
                      width: 130,
                      height: 70,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kcDarkGreyColor),
                      child: Center(
                        child: text_helper(
                            data: title,
                            font: poppins,
                            color: white,
                            size: fontSize14),
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text_helper(
                        data: "You have $title Plan",
                        font: poppins,
                        color: kcDarkGreyColor,
                        textAlign: TextAlign.start,
                        bold: true,
                        size: fontSize16),
                    text_helper(
                        data: "Click here to change your plan",
                        font: poppins,
                        color: kcDarkGreyColor,
                        textAlign: TextAlign.start,
                        size: fontSize10),
                    verticalSpaceSmall,
                    ro(b1 + " Booking than renew plan"),
                    ro(b2),
                    verticalSpaceMedium,
                    text_helper(
                        data: "Rs " + price,
                        font: poppins,
                        color: kcDarkGreyColor,
                        textAlign: TextAlign.start,
                        bold: true,
                        size: fontSize16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ro(String des) {
    return Row(
      children: [
        Image.asset(
          "assets/tick.png",
          width: 30,
          height: 30,
        ),
        horizontalSpaceTiny,
        Expanded(
          child: text_helper(
              data: des,
              font: poppins,
              color: kcDarkGreyColor,
              textAlign: TextAlign.start,
              size: fontSize12),
        ),
      ],
    );
  }

  @override
  PlansViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlansViewModel();
}
