import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_veiw_helper.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelpers/apihelper.dart';
import '../../../common/uihelper/snakbar_helper.dart';
import '../../../common/uihelper/text_helper.dart';
import '../../../common/app_strings.dart';
import '../../../common/ui_helpers.dart';
import 'services_model.dart';

class Services extends StackedView<ServicesModel> {
  Services({super.key, this.number = "", this.admin = false});
  String number;
  bool admin;

  @override
  Widget builder(
    BuildContext context,
    ServicesModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: white,
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
                future: number.isNotEmpty
                    ? ApiHelper.getservices(number)
                    : ApiHelper.getservice(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (viewModel.search.text.isEmpty) {
                          return listdata(context, snapshot, index, viewModel);
                        } else {
                          if (snapshot.data[index]['number']['title']
                              .toLowerCase()
                              .contains(viewModel.search.text.toLowerCase())) {
                            return listdata(
                                context, snapshot, index, viewModel);
                          } else {
                            return const SizedBox.shrink();
                          }
                        }
                      },
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listdata(BuildContext context, AsyncSnapshot snapshot, int index,
      ServicesModel viewModel) {
    return Container(
      width: screenWidth(context),
      padding: const EdgeInsetsDirectional.all(10),
      margin: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: [
            BoxShadow(
                color: getColorWithOpacity(kcLightGrey, 0.1),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: snapshot.data[index]['user']['img'],
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
                    data: snapshot.data[index]['user']['name'],
                    font: poppins,
                    color: kcDarkGreyColor,
                    size: fontSize14,
                    bold: true,
                  ),
                  text_helper(
                    data: snapshot.data[index]['user']['number'],
                    font: poppins,
                    color: kcDarkGreyColor,
                    size: fontSize10,
                  ),
                  text_helper(
                    data: snapshot.data[index]['user']['address'],
                    font: poppins,
                    color: kcDarkGreyColor,
                    size: fontSize10,
                  ),
                ],
              )
            ],
          ),
          verticalSpaceSmall,
          text_helper(
            data: snapshot.data[index]['number']['title'],
            font: poppins,
            color: kcDarkGreyColor,
            size: fontSize14,
            bold: true,
          ),
          text_helper(
            data: snapshot.data[index]['number']['des'],
            font: poppins,
            color: kcDarkGreyColor,
            size: fontSize12,
            textAlign: TextAlign.start,
          ),
          verticalSpaceTiny,
          rowtext(
              Icons.timer, snapshot.data[index]['number']['duration'] + " min"),
          verticalSpaceTiny,
          FutureBuilder(
            future: ApiHelper.alladmin(),
            builder: (BuildContext context, AsyncSnapshot snapshot2) {
              if (snapshot2.hasData) {
                String amt = "";
                if (snapshot.data[index]['user']['servantcat'] == "gardner") {
                  amt = snapshot2.data[0]['g'];
                } else if (snapshot.data[index]['user']['servantcat'] ==
                    "cook") {
                  amt = snapshot2.data[0]['c'];
                } else if (snapshot.data[index]['user']['servantcat'] ==
                    "sweaper") {
                  amt = snapshot2.data[0]['s'];
                } else {
                  amt = snapshot2.data[0]['b'];
                }
                return rowtext(
                    Icons.currency_exchange,
                    (int.parse(snapshot.data[index]['number']['price']) +
                            int.parse(amt))
                        .toString());
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
          verticalSpaceTiny,
          rowtext(Icons.timelapse, snapshot.data[index]['number']['frequency']),
          verticalSpaceTiny,
          admin
              ? const SizedBox.shrink()
              : button_helper(
                  onpress: () =>
                      confirmbookin(context, viewModel, snapshot, index),
                  color: amber,
                  width: screenWidth(context),
                  child: text_helper(
                      data: "Book now",
                      font: poppins,
                      color: kcDarkGreyColor,
                      bold: true,
                      size: fontSize14)),
        ],
      ),
    );
  }

  Widget rowtext(IconData iconData, String text) {
    return Row(
      children: [
        Icon(iconData),
        horizontalSpaceSmall,
        Expanded(
          child: text_helper(
              data: text,
              bold: true,
              font: roboto,
              textAlign: TextAlign.start,
              color: kcDarkGreyColor,
              size: fontSize12),
        ),
      ],
    );
  }

  void confirmbookin(BuildContext context, ServicesModel viewModel,
      AsyncSnapshot snapshot, int index) {
    viewModel.notes.clear();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: white,
            child: Container(
              width: screenWidth(context),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  text_helper(
                    data: "Are you sure you want to book this service?",
                    font: poppins,
                    color: kcDarkGreyColor,
                    size: fontSize14,
                    bold: true,
                  ),
                  verticalSpaceSmall,
                  text_view_helper(
                      hint: "Additional Notes",
                      showicon: true,
                      icon: const Icon(Icons.notes),
                      controller: viewModel.notes),
                  verticalSpaceTiny,
                  button_helper(
                      onpress: () => viewModel.book(
                          context,
                          snapshot.data[index]['user']['number'],
                          snapshot.data[index]['number']['_id'],
                          int.parse(snapshot.data[index]['number']['price']),
                          snapshot.data[index]['user']['servantcat']),
                      color: amber,
                      width: screenWidth(context),
                      child: text_helper(
                          data: "Confirm Booking",
                          font: poppins,
                          color: kcDarkGreyColor,
                          bold: true,
                          size: fontSize14)),
                ],
              ),
            ),
          );
        });
  }

  @override
  ServicesModel viewModelBuilder(
    BuildContext context,
  ) =>
      ServicesModel();
}
