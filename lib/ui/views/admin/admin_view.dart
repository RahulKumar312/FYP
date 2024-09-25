import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:servant_industry_hiring/ui/common/apihelpers/apihelper.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_veiw_helper.dart';
import 'package:servant_industry_hiring/ui/widgets/common/orders/orders.dart';
import 'package:servant_industry_hiring/ui/widgets/common/services/services.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/uihelper/snakbar_helper.dart';
import 'admin_viewmodel.dart';

class AdminView extends StackedView<AdminViewModel> {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AdminViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => viewModel.logout(),
            child: const Icon(Icons.logout),
          ),
          backgroundColor: amber,
          title: text_helper(
            data: "Admin Panel",
            font: poppins,
            color: kcDarkGreyColor,
            size: fontSize18,
            bold: true,
          ),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    c(context, "assets/user.png", "Users", Colors.blue, 0.3,
                        () => user(context)),
                    c(context, "assets/service.png", "Service", Colors.amber,
                        0.4, () => service(context)),
                    c(context, "assets/plans.png", "Plans", Colors.green, 0.3,
                        () => plans(context)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    c(context, "assets/order.png", "Orders", red, 0.4,
                        () => order(context)),
                    c(context, "assets/commission.png", "Commission",
                        Colors.yellow, 0.35, () => commission(context)),
                    c(context, "assets/wallet.png", "Wallet", Colors.brown, 0.3,
                        () => viewModel.wallet()),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget c(BuildContext context, String img, String text, Color col,
      double height, Function f) {
    return InkWell(
      onTap: () => f(),
      child: Container(
        width: double.infinity,
        height: screenWidthCustom(context, height),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getColorWithOpacity(col, 0.5)),
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/bac.png",
                      fit: BoxFit.cover,
                    ))),
            Positioned.fill(
                child: Opacity(
                    opacity: 0.15,
                    child: Transform.rotate(
                      angle: 3.1,
                      child: Image.asset(
                        "assets/bac.png",
                        fit: BoxFit.cover,
                      ),
                    ))),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    img,
                    height: 50,
                    width: 50,
                  ),
                  verticalSpaceSmall,
                  text_helper(
                    data: text,
                    font: poppins,
                    color: kcDarkGreyColor,
                    size: fontSize14,
                    bold: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void order(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Orders(
            admin: true,
          );
        });
  }

  void service(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Services(
            admin: true,
          );
        });
  }

  void commission(BuildContext context) {
    TextEditingController sweaper = TextEditingController();
    TextEditingController gardner = TextEditingController();
    TextEditingController babysitter = TextEditingController();
    TextEditingController cook = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: screenWidth(context),
            padding: const EdgeInsets.all(10),
            color: white,
            child: FutureBuilder(
              future: ApiHelper.alladmin(),
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
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text_helper(
                            data: "Set Commission",
                            font: poppins,
                            color: green,
                            size: fontSize20,
                            bold: true,
                          ),
                          verticalSpaceMedium,
                          text_helper(
                            data: "Sweeper " + snapshot.data[0]['s'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter new Sweeper Commission",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: sweaper),
                          text_helper(
                            data: "Gardner " + snapshot.data[0]['g'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter new Gardner Commission",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: gardner),
                          text_helper(
                            data: "Baby Sitter " + snapshot.data[0]['b'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter new Baby Sitter Commission",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: babysitter),
                          text_helper(
                            data: "Cook " + snapshot.data[0]['c'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter new Cook Commission",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: cook),
                          verticalSpaceMedium,
                          button_helper(
                              onpress: () async => {
                                    displayprogress(context),
                                    await ApiHelper.admincom(
                                        snapshot.data[0]['_id'],
                                        gardner.text.isNotEmpty
                                            ? gardner.text
                                            : snapshot.data[0]['g'],
                                        cook.text.isNotEmpty
                                            ? cook.text
                                            : snapshot.data[0]['c'],
                                        sweaper.text.isNotEmpty
                                            ? sweaper.text
                                            : snapshot.data[0]['s'],
                                        babysitter.text.isNotEmpty
                                            ? babysitter.text
                                            : snapshot.data[0]['b']),
                                    hideprogress(context),
                                    Navigator.pop(context)
                                  },
                              color: red,
                              width: screenWidth(context),
                              child: text_helper(
                                data: "Update",
                                font: poppins,
                                color: kcDarkGreyColor,
                                size: fontSize14,
                                bold: true,
                              ))
                        ],
                      ),
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
          );
        });
  }

  void plans(BuildContext context) {
    TextEditingController basic = TextEditingController();
    TextEditingController pre = TextEditingController();
    TextEditingController plat = TextEditingController();
    TextEditingController basicd = TextEditingController();
    TextEditingController pred = TextEditingController();
    TextEditingController platd = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: screenWidth(context),
            padding: const EdgeInsets.all(10),
            color: white,
            child: FutureBuilder(
              future: ApiHelper.alladmin(),
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
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text_helper(
                            data: "Set Plans",
                            font: poppins,
                            color: green,
                            size: fontSize20,
                            bold: true,
                          ),
                          verticalSpaceMedium,
                          text_helper(
                            data: "basic " + snapshot.data[0]['basic'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter basic plan",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: basic),
                          text_helper(
                            data: "Premium " + snapshot.data[0]['pre'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter new Premium plan",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: pre),
                          text_helper(
                            data: "Platinum " + snapshot.data[0]['plat'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter platinum plan",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: plat),
                          verticalSpaceMedium,
                          text_helper(
                            data: "basic discount" + snapshot.data[0]['basicd'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter basic plan discount",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: basicd),
                          text_helper(
                            data: "Premium discount " + snapshot.data[0]['pred'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter new Premium plan discount",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: pred),
                          text_helper(
                            data: "Platinum discount " + snapshot.data[0]['platd'],
                            font: poppins,
                            color: kcDarkGreyColor,
                            size: fontSize14,
                            bold: true,
                          ),
                          text_view_helper(
                              hint: "Enter platinum plan discount",
                              showicon: true,
                              icon: const Icon(Icons.circle),
                              textInputType: TextInputType.number,
                              controller: platd),
                          verticalSpaceMedium,
                          button_helper(
                              onpress: () async => {
                                    displayprogress(context),
                                    await ApiHelper.adminplan(
                                      snapshot.data[0]['_id'],
                                      basic.text.isNotEmpty
                                          ? basic.text
                                          : snapshot.data[0]['basic'],
                                      pre.text.isNotEmpty
                                          ? pre.text
                                          : snapshot.data[0]['pre'],
                                      plat.text.isNotEmpty
                                          ? plat.text
                                          : snapshot.data[0]['plat'],
                                      basicd.text.isNotEmpty
                                          ? basicd.text
                                          : snapshot.data[0]['basicd'],
                                      pred.text.isNotEmpty
                                          ? pred.text
                                          : snapshot.data[0]['pred'],
                                      platd.text.isNotEmpty
                                          ? platd.text
                                          : snapshot.data[0]['platd'],
                                    ),
                                    hideprogress(context),
                                    Navigator.pop(context)
                                  },
                              color: red,
                              width: screenWidth(context),
                              child: text_helper(
                                data: "Update",
                                font: poppins,
                                color: kcDarkGreyColor,
                                size: fontSize14,
                                bold: true,
                              ))
                        ],
                      ),
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
          );
        });
  }

  void user(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(10),
            color: white,
            child: FutureBuilder(
              future: ApiHelper.allusers(),
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
                        return Container(
                          width: screenWidth(context),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: snapshot.data[index]['status'] == "true"
                                  ? getColorWithOpacity(amber, 0.1)
                                  : getColorWithOpacity(green, 0.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data[index]['img'],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: screenWidthCustom(context, 0.12),
                                        height:
                                            screenWidthCustom(context, 0.12),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          displaysimpleprogress(context),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                        color: kcDarkGreyColor,
                                      ),
                                    ),
                                  ),
                                  horizontalSpaceMedium,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ro("name", snapshot.data[index]['name']),
                                      ro("number",
                                          snapshot.data[index]['number']),
                                      ro("cnic", snapshot.data[index]['cnic']),
                                      ro("gender",
                                          snapshot.data[index]['gender']),
                                      ro("address",
                                          snapshot.data[index]['address']),
                                    ],
                                  )
                                ],
                              ),
                              verticalSpaceSmall,
                              ro("type", snapshot.data[index]['cat']),
                              ro("status", snapshot.data[index]['status']),
                              snapshot.data[index]['cat'] == "servant"
                                  ? Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            imageUrl: snapshot.data[index]
                                                ['pvcdoc'],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: screenWidthCustom(
                                                  context, 0.12),
                                              height: screenWidthCustom(
                                                  context, 0.12),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                displaysimpleprogress(context),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(
                                              Icons.error,
                                              color: kcDarkGreyColor,
                                            ),
                                          ),
                                        ),
                                        horizontalSpaceMedium,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            verticalSpaceSmall,
                                            ro(
                                                "fathername",
                                                snapshot.data[index]
                                                    ['fathername']),
                                            ro(
                                                "experience",
                                                snapshot.data[index]
                                                    ['experience']),
                                            ro(
                                                "pvcname",
                                                snapshot.data[index]
                                                    ['pvcname']),
                                            ro(
                                                "pvcnumber",
                                                snapshot.data[index]
                                                    ['pvcnumber']),
                                            ro(
                                                "servant cat",
                                                snapshot.data[index]
                                                    ['servantcat']),
                                          ],
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              verticalSpaceSmall,
                              button_helper(
                                  onpress: () async => {
                                        displayprogress(context),
                                        await ApiHelper.deleteuser(
                                            snapshot.data[index]["_id"],
                                            snapshot.data[index]['status'] ==
                                                    "true"
                                                ? "false"
                                                : "true",
                                            context),
                                        hideprogress(context),
                                        Navigator.pop(context)
                                      },
                                  color: red,
                                  width: screenWidthCustom(context, 0.3),
                                  child: text_helper(
                                    data:
                                        snapshot.data[index]['status'] == "true"
                                            ? "Suspend/Delete"
                                            : "Approve",
                                    font: poppins,
                                    color: white,
                                    size: fontSize10,
                                    bold: true,
                                  ))
                            ],
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
            ),
          );
        });
  }

  Widget ro(String title, String des) {
    return Row(
      children: [
        text_helper(
          data: title,
          font: poppins,
          color: kcDarkGreyColor,
          size: fontSize10,
          bold: true,
        ),
        horizontalSpaceSmall,
        text_helper(
            data: des, font: poppins, color: kcDarkGreyColor, size: fontSize10),
      ],
    );
  }

  @override
  AdminViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminViewModel();
}
