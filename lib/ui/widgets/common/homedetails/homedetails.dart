import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:servant_industry_hiring/ui/common/apihelpers/apihelper.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_strings.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/uihelper/snakbar_helper.dart';
import '../../../common/uihelper/text_helper.dart';
import '../userdetails/userdetails.dart';
import 'homedetails_model.dart';

class Homedetails extends StackedView<HomedetailsModel> {
  const Homedetails({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomedetailsModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Userdetails(),
              textwithpad('Plans', fontSize18),
              plans(context, viewModel),
              textwithpad('LookingFor', fontSize18),
              OutlineSearchBar(
                margin: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                backgroundColor: white,
                borderRadius: BorderRadius.circular(10),
                borderColor: kcVeryLightGrey,
                borderWidth: 2,
                cursorColor: amber,
                clearButtonColor: amber,
                clearButtonIconColor: white,
                hintText: "LookingFor",
                ignoreSpecialChar: true,
                searchButtonIconColor: amber,
                hintStyle: text_helper.customstyle(
                    poppins, kcLightGrey, fontSize12, context, false),
                textStyle: text_helper.customstyle(
                    poppins, kcDarkGreyColor, fontSize12, context, true),
                textEditingController: viewModel.search,
                onKeywordChanged: (String val) {
                  viewModel.notifyListeners();
                },
              ),
              verticalSpaceTiny,
              textwithpad('Popularservices', fontSize12),
              Container(
                width: screenWidth(context),
                padding: const EdgeInsetsDirectional.all(10),
                height: 100,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () => viewModel.nav("cook"),
                        child: pops('assets/cook.png', 'cook', '250reviews')),
                    InkWell(
                        onTap: () => viewModel.nav("gardner"),
                        child: pops(
                            'assets/gardner.png', 'gardner', '250reviews')),
                  ],
                ),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textwithpad('categories', fontSize12),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      btn(viewModel, 0, context),
                      btn(viewModel, 1, context),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        btn(viewModel, 2, context),
                        btn(viewModel, 3, context)
                      ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btn(HomedetailsModel viewModel, int index, BuildContext context) {
    return InkWell(
      onTap: () => viewModel.nav(viewModel.cat[index]['name']),
      child: Container(
          margin: const EdgeInsetsDirectional.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(2, 2),
                  blurRadius: 6.0,
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  viewModel.cat[index]['img'],
                  fit: BoxFit.fill,
                  width: 80,
                  height: 80,
                ),
              ),
              verticalSpaceSmall,
              text_helper(
                  data: viewModel.cat[index]['name'],
                  bold: true,
                  font: poppins,
                  color: kcDarkGreyColor,
                  size: fontSize14)
            ],
          )),
    );
  }

  Widget textwithpad(String txt, double font) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: text_helper(
          data: txt,
          font: poppins,
          bold: true,
          color: kcDarkGreyColor,
          size: font),
    );
  }

  Widget pops(String img, String title, String des) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      child: Row(
        children: [
          Image.asset(img),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text_helper(
                  data: title,
                  font: poppins,
                  color: kcDarkGreyColor,
                  bold: true,
                  size: fontSize12),
              text_helper(
                  data: des,
                  font: poppins,
                  color: kcDarkGreyColor,
                  size: fontSize10),
            ],
          )
        ],
      ),
    );
  }

  Widget plans(BuildContext context, HomedetailsModel viewModel) {
    return FutureBuilder(
      future: ApiHelper.findone(
          viewModel.sharedpref.readString("phone").toString()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return InkWell(
            onTap: () => viewModel.plan(),
            child: Container(
              width: screenWidth(context),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      colors: [Color(0xFFff6e7f), Color(0xFFbfe9ff)])),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Opacity(
                      opacity: 0.4,
                      child: text_helper(
                          data: "100", font: poppins, color: white, size: 80),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 130,
                        height: 70,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(colors: [
                              Color(0xFFbfe9ff),
                              Color(0xFFff6e7f)
                            ])),
                        child: Container(
                          width: 130,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: white),
                          child: Container(
                            width: 130,
                            height: 70,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: kcDarkGreyColor),
                            child: Center(
                              child: text_helper(
                                  data: snapshot.data['plans'] == "0"
                                      ? "No Plan"
                                      : snapshot.data['plans'] == "1"
                                          ? "Basic"
                                          : snapshot.data['plans'] == "2"
                                              ? "Premium"
                                              : "Platinum",
                                  font: poppins,
                                  color: white,
                                  size: fontSize14),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpaceSmall,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text_helper(
                                data: snapshot.data['plans'] == "0"
                                    ? "You have No Plan"
                                    : snapshot.data['plans'] == "1"
                                        ? "You have Basic Plan"
                                        : snapshot.data['plans'] == "2"
                                            ? "You have Premium Plan"
                                            : "You have Platinum Plan",
                                font: poppins,
                                color: kcDarkGreyColor,
                                textAlign: TextAlign.start,
                                bold: true,
                                size: fontSize16),
                            text_helper(
                                data: "Click here to change your plan",
                                font: poppins,
                                color: kcDarkGreyColor,
                                size: fontSize10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
    );
  }

  @override
  HomedetailsModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomedetailsModel();
}
