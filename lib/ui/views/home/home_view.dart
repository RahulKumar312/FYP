import 'package:flutter/material.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/widgets/common/addservice/addservice.dart';
import 'package:servant_industry_hiring/ui/widgets/common/analysis/analysis.dart';
import 'package:servant_industry_hiring/ui/widgets/common/orders/orders.dart';
import 'package:servant_industry_hiring/ui/widgets/common/userdetails/userdetails.dart';
import 'package:stacked/stacked.dart';

import '../../common/apihelpers/apihelper.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../common/uihelper/snakbar_helper.dart';
import '../../common/uihelper/text_helper.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
            child: Column(
          children: [
            const Userdetails(),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsetsDirectional.all(0),
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                      decoration: BoxDecoration(
                          color: getColorWithOpacity(kcLightGrey, 0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TabBar(
                        dividerHeight: 0,
                        indicatorColor: kcDarkGreyColor,
                        tabs: viewModel.tabs,
                        unselectedLabelColor: kcLightGrey,
                        labelColor: kcDarkGreyColor,
                        onTap: (index) {
                          viewModel.currentindex = index;
                          viewModel.notifyListeners();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Tab0(viewModel, context),
                          Tab1(),
                          Tab2(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addservice(context, {}),
          backgroundColor: amber,
          child: const Icon(
            Icons.add,
            color: kcDarkGreyColor,
            size: 30,
          ),
        ));
  }

  void addservice(BuildContext context, Map data) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Addservice(
            data: data,
          );
        });
  }

  Widget Tab0(HomeViewModel viewModel, BuildContext context) {
    return FutureBuilder(
      future: ApiHelper.getservices(viewModel.sharedpref.readString('phone')),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.toString() == '[]') {
            return Center(
              child: text_helper(
                  data: "NoData",
                  font: poppins,
                  color: kcDarkGreyColor,
                  size: fontSize14),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => addservice(
                      context, snapshot.data[index]['number'] as Map),
                  child: Container(
                    width: screenWidth(context),
                    padding: const EdgeInsetsDirectional.all(10),
                    margin: const EdgeInsetsDirectional.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: const Offset(2, 2),
                              color: getColorWithOpacity(kcLightGrey, 0.1))
                        ],
                        color: white),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              'assets/bac.png',
                              fit: BoxFit.cover,
                              width: screenWidthCustom(context, 1),
                              height: screenHeightCustom(context, 0.3),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text_helper(
                                data: snapshot.data[index]['number']['title']
                                    .toString(),
                                font: poppins,
                                bold: true,
                                color: kcDarkGreyColor,
                                size: fontSize18),
                            text_helper(
                                data: snapshot.data[index]['number']['des']
                                    .toString(),
                                font: roboto,
                                textAlign: TextAlign.start,
                                color: kcDarkGreyColor,
                                size: fontSize12),
                            rowtext(Icons.timer,
                                "${snapshot.data[index]['number']['duration']} min"),
                            verticalSpaceTiny,
                            rowtext(
                                Icons.currency_exchange,
                                snapshot.data[index]['number']['price']
                                    .toString()),
                            verticalSpaceTiny,
                            rowtext(
                                Icons.timelapse,
                                snapshot.data[index]['number']['frequency']
                                    .toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
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
    );
  }

  Widget Tab1() {
    return Orders(
      servant: true,
    );
  }

  Widget Tab2() {
    return const Analysis();
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

  Widget rowdata(String title, String des, BuildContext context) {
    return Container(
      width: screenWidth(context),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      child: Row(
        children: [
          text_helper(
              data: title,
              bold: true,
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize14),
          horizontalSpaceMedium,
          text_helper(
              data: des,
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize14),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
