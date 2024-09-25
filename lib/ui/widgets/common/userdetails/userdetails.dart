import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_strings.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/uihelper/button_helper.dart';
import '../../../common/uihelper/snakbar_helper.dart';
import '../../../common/uihelper/text_helper.dart';
import 'userdetails_model.dart';

class Userdetails extends StackedView<UserdetailsModel> {
  const Userdetails({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserdetailsModel viewModel,
    Widget? child,
  ) {
    return InkWell(
      onTap: () => namebottom(context, viewModel),
      child: Container(
        width: screenWidth(context),
        height: 70,
        margin: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: getColorWithOpacity(amber, 0.1),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                child: ClipPath(
                  clipper: OvalRightBorderClipper(),
                  child: Container(
                    height: 180,
                    width: screenWidthCustom(context, 0.6),
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsetsDirectional.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: getColorWithOpacity(white, 0.5)),
                            child: const Icon(
                              Icons.menu,
                              color: kcDarkGreyColor,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text_helper(
                                  data: viewModel.sharedpref.readString('name'),
                                  bold: true,
                                  font: montserrat,
                                  color: kcDarkGreyColor,
                                  size: fontSize12),
                              text_helper(
                                  data:
                                      viewModel.sharedpref.readString('phone'),
                                  font: montserrat,
                                  color: kcDarkGreyColor,
                                  size: fontSize10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Opacity(
                opacity: 0.15,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(30)),
                  child: Image.asset(
                    'assets/bac.png',
                    fit: BoxFit.cover,
                    width: screenWidthCustom(context, 0.7),
                    height: 70,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void namebottom(BuildContext context, UserdetailsModel viewModel) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            width: screenWidth(context),
            height: screenHeightCustom(context, 0.9),
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: ListView(
              children: [
                Container(
                  width: screenWidth(context),
                  height: screenHeightCustom(context, 0.3),
                  decoration: const BoxDecoration(
                    color: amber,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: Opacity(
                          opacity: 0.25,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30)),
                            child: Image.asset(
                              'assets/bac.png',
                              fit: BoxFit.cover,
                              width: screenWidthCustom(context, 1),
                              height: screenHeightCustom(context, 0.3),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 50,
                          width: screenWidth(context),
                          decoration: const BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                        ),
                      ),
                      Positioned(
                        left: screenHeightCustom(context, 0.17),
                        bottom: 0,
                        child: CachedNetworkImage(
                          imageUrl: viewModel.sharedpref.readString('img'),
                          imageBuilder: (context, imageProvider) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsetsDirectional.all(2),
                              color: white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: screenWidthCustom(context, 0.4),
                                  height: screenWidthCustom(context, 0.4),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              displaysimpleprogress(context),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                      color: getColorWithOpacity(kcLightGrey, 0.1),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsetsDirectional.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      button_helper(
                          onpress: () => viewModel.logout(),
                          color: white,
                          width: screenWidth(context),
                          child: rowtext(Icons.logout, "Logout")),
                      button_helper(
                          onpress: () => viewModel.language(context),
                          color: white,
                          width: screenWidth(context),
                          child: rowtext(Icons.language, "englist/urdu")),
                      button_helper(
                          onpress: () => viewModel.wallet(),
                          color: white,
                          width: screenWidth(context),
                          child: rowtext(Icons.wallet, "wallet")),
                      button_helper(
                          onpress: () => viewModel.allchats(),
                          color: white,
                          width: screenWidth(context),
                          child: rowtext(Icons.wallet, "Chats")),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: getColorWithOpacity(kcLightGrey, 0.1),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsetsDirectional.all(10),
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Column(
                    children: [
                      rowdata('name', viewModel.sharedpref.readString('name'),
                          context),
                      viewModel.sharedpref.readString('fathername') != ''
                          ? rowdata(
                              'fathername',
                              viewModel.sharedpref.readString('fathername'),
                              context)
                          : const SizedBox.shrink(),
                      rowdata('number',
                          viewModel.sharedpref.readString('phone'), context),
                      rowdata('cnic', viewModel.sharedpref.readString('cnic'),
                          context),
                      rowdata('address',
                          viewModel.sharedpref.readString('address'), context),
                      rowdata('age', viewModel.sharedpref.readString('age'),
                          context),
                      rowdata('gender',
                          viewModel.sharedpref.readString('gender'), context),
                      viewModel.sharedpref.readString('fathername') != ''
                          ? rowdata(
                              'experience',
                              viewModel.sharedpref.readString('experience'),
                              context)
                          : const SizedBox.shrink(),
                      viewModel.sharedpref.readString('fathername') != ''
                          ? rowdata(
                              'pvcname',
                              viewModel.sharedpref.readString('pvcname'),
                              context)
                          : const SizedBox.shrink(),
                      viewModel.sharedpref.readString('fathername') != ''
                          ? rowdata(
                              'pvcnumber',
                              viewModel.sharedpref.readString('pvcnumber'),
                              context)
                          : const SizedBox.shrink(),
                      viewModel.sharedpref.readString('fathername') != ''
                          ? Container(
                              width: screenWidth(context),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              margin:
                                  const EdgeInsetsDirectional.only(bottom: 10),
                              child: Row(
                                children: [
                                  text_helper(
                                      data: "pvcimg",
                                      font: poppins,
                                      bold: true,
                                      color: kcDarkGreyColor,
                                      size: fontSize14),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                      viewModel.sharedpref.readString('fathername') != ''
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: screenWidth(context),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                margin: const EdgeInsetsDirectional.only(
                                    bottom: 10),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: viewModel.sharedpref
                                          .readString('pvcimg'),
                                      imageBuilder: (context, imageProvider) =>
                                          ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            width:
                                                screenWidthCustom(context, 0.2),
                                            height:
                                                screenWidthCustom(context, 0.2),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          displaysimpleprogress(context),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          );
        });
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

  @override
  UserdetailsModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserdetailsModel();
}
