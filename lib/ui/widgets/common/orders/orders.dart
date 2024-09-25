import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_veiw_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.router.dart';
import '../../../common/apihelpers/apihelper.dart';
import '../../../common/app_strings.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/uihelper/snakbar_helper.dart';
import '../../../common/uihelper/text_helper.dart';
import '../../../views/chat/chating/chating_view.dart';
import 'orders_model.dart';

class Orders extends StackedView<OrdersModel> {
  Orders({super.key, this.servant = false, this.admin = false});
  bool servant;
  bool admin;

  @override
  Widget builder(
    BuildContext context,
    OrdersModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: text_helper(
                    data: "All Orders",
                    font: roboto,
                    color: kcDarkGreyColor,
                    size: fontSize20,
                    bold: true),
              ),
            ),
            Row(children: [
              btn("all", viewModel),
              btn("new", viewModel),
              btn("cancel", viewModel),
              btn("old", viewModel),
            ]),
            Expanded(
              child: FutureBuilder(
                future: admin
                    ? ApiHelper.allbooking()
                    : servant
                        ? ApiHelper.allbookingbysid(
                            viewModel.sharedpref.readString('phone'))
                        : ApiHelper.allbookingbyuid(
                            viewModel.sharedpref.readString('phone')),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (viewModel.val == 'all') {
                          return listdatamain(
                              context, snapshot, index, viewModel);
                        } else {
                          if (viewModel.val ==
                              snapshot.data![index]['status']) {
                            return listdatamain(
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

  Widget listdatamain(BuildContext context, AsyncSnapshot snapshot, int index,
      OrdersModel viewModel) {
    return Container(
      width: screenWidth(context),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
        boxShadow: [
          BoxShadow(
            color: getColorWithOpacity(kcLightGrey, 0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text_helper(
              data: "User",
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize14,
              bold: true),
          userdata(snapshot.data[index]['uid']),
          verticalSpaceSmall,
          text_helper(
              data: "Servant",
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize14,
              bold: true),
          userdata(snapshot.data[index]['sid']),
          verticalSpaceSmall,
          text_helper(
              data: "Service Details",
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize14,
              bold: true),
          servantdata(snapshot.data[index]['sverid']),
          verticalSpaceSmall,
          text_helper(
              data: snapshot.data[index]['notes'],
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize12),
          text_helper(
              data: snapshot.data[index]['date'].toString().substring(0, 10),
              font: poppins,
              color: kcDarkGreyColor,
              size: fontSize12),
          text_helper(
            data: snapshot.data[index]['status'],
            font: poppins,
            color: kcDarkGreyColor,
            size: fontSize12,
            bold: true,
          ),
          SizedBox(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(snapshot.data[index]['lat']),
                    double.parse(snapshot.data[index]['lon'])),
                zoom: 15.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('marker'),
                  position: LatLng(double.parse(snapshot.data[index]['lat']),
                      double.parse(snapshot.data[index]['lon'])),
                ),
              },
            ),
          ),
          !admin
              ? Column(
                  children: [
                    button_helper(
                        onpress: () async {
                          String s = '';
                          String u = '';
                          if (viewModel.sharedpref.readString("cat") !=
                              "hire") {
                            Map k = await ApiHelper.findone(
                                snapshot.data[index]['uid']);
                            u = k['number'];
                            s = viewModel.sharedpref
                                .readString("phone")
                                .toString();
                          } else {
                            Map k = await ApiHelper.findone(
                                snapshot.data[index]['sid']);
                            s = k['number'];
                            u = viewModel.sharedpref
                                .readString("phone")
                                .toString();
                          }

                          Map c = await ApiHelper.registerchat(u, s);
                          if (c['status']) {
                            viewModel.navigationService.navigateWithTransition(
                                ChatingView(
                                  id: c['message'],
                                  did: c['did'],
                                ),
                                routeName: Routes.chatingView,
                                transitionStyle: Transition.rightToLeft);
                          }
                        },
                        color: green,
                        width: screenWidthCustom(context, 1),
                        child: text_helper(
                          data: "Chat",
                          font: poppins,
                          color: white,
                          size: fontSize14,
                          bold: true,
                        )),
                    !servant
                        ? button_helper(
                            onpress: () => addreview(context, index, snapshot),
                            color: red,
                            width: screenWidthCustom(context, 1),
                            child: text_helper(
                              data: "Add Review",
                              font: poppins,
                              color: white,
                              size: fontSize14,
                              bold: true,
                            ))
                        : const SizedBox.shrink(),
                    servant
                        ? snapshot.data[index]['status'] == "new"
                            ? button_helper(
                                onpress: () => viewModel.cancel(
                                    snapshot.data[index]['_id'], "old"),
                                color: amber,
                                width: screenWidthCustom(context, 1),
                                child: text_helper(
                                  data: "Done",
                                  font: poppins,
                                  color: kcDarkGreyColor,
                                  size: fontSize14,
                                  bold: true,
                                ))
                            : const SizedBox.shrink()
                        : snapshot.data[index]['status'] == "new"
                            ? button_helper(
                                onpress: () => viewModel.cancel(
                                    snapshot.data[index]['_id'], "cancel"),
                                color: amber,
                                width: screenWidthCustom(context, 1),
                                child: text_helper(
                                  data: "cancel",
                                  font: poppins,
                                  color: kcDarkGreyColor,
                                  size: fontSize14,
                                  bold: true,
                                ))
                            : const SizedBox.shrink()
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget userdata(String num) {
    return FutureBuilder(
      future: ApiHelper.findone(num),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: screenWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: getColorWithOpacity(amber, 0.2)),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: snapshot.data['img'],
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
                      data: snapshot.data['name'],
                      font: poppins,
                      color: kcDarkGreyColor,
                      size: fontSize14,
                      bold: true,
                    ),
                    text_helper(
                      data: snapshot.data['number'],
                      font: poppins,
                      color: kcDarkGreyColor,
                      size: fontSize10,
                    ),
                    text_helper(
                      data: snapshot.data['address'],
                      font: poppins,
                      color: kcDarkGreyColor,
                      size: fontSize10,
                    ),
                  ],
                )
              ],
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

  Widget servantdata(String id) {
    return FutureBuilder(
      future: ApiHelper.getoneservice(id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: screenWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: getColorWithOpacity(amber, 0.2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text_helper(
                  data: snapshot.data['title'],
                  font: poppins,
                  color: kcDarkGreyColor,
                  size: fontSize14,
                  bold: true,
                ),
                text_helper(
                  data: snapshot.data['des'],
                  font: poppins,
                  color: kcDarkGreyColor,
                  size: fontSize12,
                  textAlign: TextAlign.start,
                ),
                verticalSpaceTiny,
                rowtext(Icons.timer, snapshot.data['duration'] + " min"),
                verticalSpaceTiny,
                rowtext(Icons.currency_exchange, snapshot.data['price']),
                verticalSpaceTiny,
                rowtext(Icons.timelapse, snapshot.data['frequency']),
              ],
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

  Widget btn(String title, OrdersModel viewModel) {
    return InkWell(
      onTap: () {
        viewModel.val = title;
        viewModel.notifyListeners();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: amber,
            ),
            color: viewModel.val == title
                ? amber
                : getColorWithOpacity(kcVeryLightGrey, 0.3)),
        child: text_helper(
            data: title,
            font: montserrat,
            color: viewModel.val != title ? kcDarkGreyColor : white,
            size: fontSize14,
            bold: true),
      ),
    );
  }

  void addreview(BuildContext context, int index, AsyncSnapshot snapshot) {
    TextEditingController message = TextEditingController();
    double a = 0;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  text_helper(
                    data: "Add Review",
                    font: poppins,
                    color: kcDarkGreyColor,
                    size: fontSize18,
                    bold: true,
                  ),
                  verticalSpaceSmall,
                  text_view_helper(
                      hint: "Enter your review ", controller: message),
                  AnimatedRatingStars(
                    initialRating: 0,
                    minRating: 0.0,
                    maxRating: 5.0,
                    filledColor: Colors.amber,
                    emptyColor: Colors.grey,
                    filledIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    emptyIcon: Icons.star_border,
                    onChanged: (double rating) {
                      a = rating;
                    },
                    displayRatingValue: true,
                    interactiveTooltips: true,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                    starSize: 20,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                  ),
                  verticalSpaceMedium,
                  button_helper(
                      onpress: () async {
                        if (message.text.toString().isEmpty || a == 0) {
                          show_snackbar(context, "Fill all fields");
                        } else {
                          displayprogress(context);
                          Map s = await ApiHelper.findone(
                              snapshot.data[index]['sid']);
                          Map u = await ApiHelper.findone(
                              snapshot.data[index]['uid']);
                          Map c = await ApiHelper.registerrating(
                            u['number'],
                            s['number'],
                            a.toString(),
                            message.text,
                          );
                          hideprogress(context);
                          Navigator.pop(context);
                        }
                      },
                      color: red,
                      width: screenWidthCustom(context, 1),
                      child: text_helper(
                        data: "Add Review",
                        font: poppins,
                        color: white,
                        size: fontSize14,
                        bold: true,
                      ))
                ],
              ),
            ),
          );
        });
  }

  @override
  OrdersModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdersModel();
}
