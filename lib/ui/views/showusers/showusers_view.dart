import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:servant_industry_hiring/ui/common/apihelpers/apihelper.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/widgets/common/services/services.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../common/uihelper/snakbar_helper.dart';
import '../../common/uihelper/text_helper.dart';
import 'showusers_viewmodel.dart';

class ShowusersView extends StackedView<ShowusersViewModel> {
  ShowusersView({Key? key, required this.cat}) : super(key: key);
  String cat;

  @override
  Widget builder(
    BuildContext context,
    ShowusersViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: amber,
          title: text_helper(
            data: cat,
            font: poppins,
            color: kcDarkGreyColor,
            size: fontSize16,
            bold: true,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
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
              Expanded(
                child: FutureBuilder(
                  future: ApiHelper.findservant(cat),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.toString() == '[]') {
                        return Center(
                          child: text_helper(
                              data: "No Data",
                              font: poppins,
                              color: kcDarkGreyColor,
                              size: fontSize14),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (viewModel.search.text.isEmpty) {
                              return listdata(context, snapshot, index);
                            } else {
                              if (snapshot.data[index]['name']
                                  .toLowerCase()
                                  .contains(
                                      viewModel.search.text.toLowerCase())) {
                                return listdata(context, snapshot, index);
                              } else {
                                return const SizedBox.shrink();
                              }
                            }
                          },
                        );
                      }
                    } else if (snapshot.hasError) {
                      return const Icon(
                        Icons.error,
                        color: kcDarkGreyColor,
                      );
                    } else {
                      return displaysimpleprogress(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget listdata(BuildContext context, AsyncSnapshot snapshot, int index) {
    return InkWell(
      onTap: () => showdetails(context, snapshot.data[index]['number']),
      child: Container(
        width: screenWidth(context),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: getColorWithOpacity(amber, 0.3),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(2, 3),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: snapshot.data[index]['img'],
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: screenWidthCustom(context, 0.15),
                        height: screenWidthCustom(context, 0.15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => displaysimpleprogress(context),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                horizontalSpaceSmall,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text_helper(
                      data: snapshot.data[index]['name'],
                      font: poppins,
                      color: kcDarkGreyColor,
                      size: fontSize14,
                      bold: true,
                    ),
                    text_helper(
                      data: snapshot.data[index]['number'],
                      font: poppins,
                      color: kcDarkGreyColor,
                      size: fontSize10,
                    ),
                    text_helper(
                      data: snapshot.data[index]['address'],
                      font: poppins,
                      color: kcDarkGreyColor,
                      size: fontSize10,
                    ),
                  ],
                )
              ],
            ),
            verticalSpaceMedium,
            FutureBuilder(
              future: ApiHelper.allratingbydid(snapshot.data[index]['number']),
              builder: (BuildContext context, AsyncSnapshot snapshot2) {
                if (snapshot2.hasData) {
                  if (snapshot2.data.toString() == '[]') {
                    return const SizedBox.shrink();
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_helper(
                            data: "All Reviews",
                            bold: true,
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14),
                        SizedBox(
                          width: screenWidth(context),
                          height: 80,
                          child: ListView.builder(
                            itemCount: snapshot2.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(2, 2),
                                          blurRadius: 1,
                                          color: Colors.grey.shade200)
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedRatingStars(
                                      initialRating: double.parse(
                                          snapshot2.data[index]['rating']),
                                      minRating: 0.0,
                                      maxRating: 5.0,
                                      filledColor: Colors.amber,
                                      emptyColor: Colors.grey,
                                      filledIcon: Icons.star,
                                      halfFilledIcon: Icons.star_half,
                                      emptyIcon: Icons.star_border,
                                      onChanged: (double rating) {},
                                      displayRatingValue: true,
                                      interactiveTooltips: true,
                                      customFilledIcon: Icons.star,
                                      customHalfFilledIcon: Icons.star_half,
                                      customEmptyIcon: Icons.star_border,
                                      starSize: 10,
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      animationCurve: Curves.easeInOut,
                                      readOnly: true,
                                    ),
                                    text_helper(
                                        data: snapshot2.data[index]['review'],
                                        font: poppins,
                                        color: kcDarkGreyColor,
                                        size: fontSize10),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
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
          ],
        ),
      ),
    );
  }

  void showdetails(BuildContext context, String number) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            width: screenWidth(context),
            height: screenHeightCustom(context, 0.8),
            child: Services(
              number: number,
            ),
          );
        });
  }

  @override
  ShowusersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShowusersViewModel();
}
