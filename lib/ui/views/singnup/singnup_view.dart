import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:servant_industry_hiring/ui/common/app_colors.dart';
import 'package:servant_industry_hiring/ui/common/app_strings.dart';
import 'package:servant_industry_hiring/ui/common/ui_helpers.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/button_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_helper.dart';
import 'package:servant_industry_hiring/ui/common/uihelper/text_veiw_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/common/loginsignuptop/loginsignuptop.dart';
import 'singnup_viewmodel.dart';

class SingnupView extends StackedView<SingnupViewModel> {
  const SingnupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingnupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: screenWidth(context),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/servanttopicon.png',
                            width: screenWidthCustom(context, 0.1),
                            height: screenWidthCustom(context, 0.1),
                          )
                              .animate(delay: 500.milliseconds)
                              .fade()
                              .scale()
                              .shake(),
                          horizontalSpaceMedium,
                          text_helper(
                                  data: "SingUp",
                                  font: poppins,
                                  color: kcDarkGreyColor,
                                  size: fontSize18,
                                  bold: true)
                              .animate(delay: 500.milliseconds)
                              .fade()
                              .moveX()
                        ],
                      ),
                      InkWell(
                          onTap: () => showvideo(context),
                          child: const Icon(Icons.video_camera_back_outlined))
                    ],
                  ),
                ),
                verticalSpaceSmall,
                Container(
                  width: screenWidthCustom(context, 0.5),
                  height: 1,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kcDarkGreyColor),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(5),
                  child: text_helper(
                      data: 'startyourbusiness',
                      font: roboto,
                      textAlign: TextAlign.start,
                      bold: true,
                      color: kcDarkGreyColor,
                      size: fontSize22),
                ),
                Container(
                  width: screenWidthCustom(context, 0.5),
                  height: 1,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kcDarkGreyColor),
                ),
                verticalSpaceSmall,
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  margin: const EdgeInsetsDirectional.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: getColorWithOpacity(kcLightGrey, 0.1)),
                  child: Column(
                    children: [
                      viewModel.sharedpref.readString('cat') == 'servant'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text_helper(
                                    data: "SelectaCategory",
                                    font: poppins,
                                    bold: true,
                                    color: kcDarkGreyColor,
                                    size: fontSize14),
                                verticalSpaceSmall,
                                SizedBox(
                                  width: screenWidth(context),
                                  height: 170,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: viewModel.cat
                                        .map((e) =>
                                            catdata(viewModel, e, context))
                                        .toList(),
                                  ),
                                ),
                                verticalSpaceMedium,
                                text_helper(
                                    data: "Enterbasicinfo",
                                    font: poppins,
                                    bold: true,
                                    color: kcDarkGreyColor,
                                    size: fontSize14),
                              ],
                            )
                              .animate(delay: 300.milliseconds)
                              .fade()
                              .moveY(begin: 50, end: 0)
                          : const SizedBox.shrink(),
                      verticalSpaceSmall,
                      text_view_helper(
                        hint: "EnterName",
                        controller: viewModel.name,
                        showicon: true,
                      )
                          .animate(delay: 500.milliseconds)
                          .fade()
                          .moveY(begin: 50, end: 0),
                      viewModel.sharedpref.readString('cat') == 'servant'
                          ? text_view_helper(
                              hint: "EnterFatherName",
                              controller: viewModel.fathername,
                              showicon: true,
                            )
                              .animate(delay: 500.milliseconds)
                              .fade()
                              .moveY(begin: 50, end: 0)
                          : const SizedBox.shrink(),
                      text_view_helper(
                        hint: "EnterCNIC",
                        controller: viewModel.cnic,
                        showicon: true,
                        icon: const Icon(Icons.file_copy_outlined),
                        textInputType: TextInputType.number,
                        formatter: [
                          FilteringTextInputFormatter.allow(getRegExpint())
                        ],
                        maxlength: 13,
                      )
                          .animate(delay: 700.milliseconds)
                          .fade()
                          .moveY(begin: 50, end: 0),
                      text_view_helper(
                        hint: "EnterPhone",
                        controller: viewModel.phone,
                        showicon: true,
                        icon: const Icon(Icons.phone),
                        textInputType: TextInputType.number,
                        formatter: [
                          FilteringTextInputFormatter.allow(getRegExpint())
                        ],
                        maxlength: 11,
                      )
                          .animate(delay: 900.milliseconds)
                          .fade()
                          .moveY(begin: 50, end: 0),
                      text_view_helper(
                        hint: "EnterAddress",
                        controller: viewModel.address,
                        showicon: true,
                        icon: const Icon(Icons.home),
                      )
                          .animate(delay: 1100.milliseconds)
                          .fade()
                          .moveY(begin: 50, end: 0),
                      text_view_helper(
                        hint: "EnterAge",
                        controller: viewModel.age,
                        showicon: true,
                        maxlength: 2,
                        textInputType: TextInputType.number,
                        formatter: [
                          FilteringTextInputFormatter.allow(getRegExpint())
                        ],
                        icon: const Icon(Icons.person),
                      )
                          .animate(delay: 1300.milliseconds)
                          .fade()
                          .moveY(begin: 50, end: 0),
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsetsDirectional.all(5),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            text_helper(
                                data: "selectgender",
                                font: poppins,
                                bold: true,
                                color: kcDarkGreyColor,
                                size: fontSize12),
                            DropdownButton<String>(
                              value: viewModel.selectedgender,
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
                                viewModel.selectedgender = newValue!;
                                viewModel.notifyListeners();
                              },
                              items: viewModel.gender
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
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
                      viewModel.sharedpref.readString('cat') == 'servant'
                          ? Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsetsDirectional.all(5),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15, 5, 15, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  text_helper(
                                      data: "Experience",
                                      font: poppins,
                                      bold: true,
                                      color: kcDarkGreyColor,
                                      size: fontSize12),
                                  DropdownButton<String>(
                                    value: viewModel.selectedExperience,
                                    icon: const Row(
                                      children: [
                                        horizontalSpaceSmall,
                                        Icon(
                                          Icons.arrow_downward,
                                          color: kcDarkGreyColor,
                                        ),
                                      ],
                                    ),
                                    style: text_helper.customstyle(
                                        poppins,
                                        kcDarkGreyColor,
                                        fontSize12,
                                        context,
                                        false),
                                    onChanged: (String? newValue) {
                                      viewModel.selectedExperience = newValue!;
                                      viewModel.notifyListeners();
                                    },
                                    items: viewModel.experienceLevels
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
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
                              .moveY(begin: 50, end: 0)
                          : const SizedBox.shrink(),
                      viewModel.sharedpref.readString('cat') == 'servant'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpaceMedium,
                                text_helper(
                                    data: "pvcdetails",
                                    font: poppins,
                                    bold: true,
                                    textAlign: TextAlign.start,
                                    color: kcDarkGreyColor,
                                    size: fontSize14),
                                text_view_helper(
                                    hint: "PVCName",
                                    showicon: true,
                                    formatter: [
                                      FilteringTextInputFormatter.allow(
                                          getRegExpstring())
                                    ],
                                    controller: viewModel.pcvname),
                                text_view_helper(
                                    hint: "PVCNumber",
                                    showicon: true,
                                    textInputType: TextInputType.phone,
                                    maxlength: 9,
                                    formatter: [
                                      FilteringTextInputFormatter.allow(
                                          getRegExpint())
                                    ],
                                    controller: viewModel.pcvnumber),
                                InkWell(
                                  onTap: () => viewModel.uploadcert(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: const EdgeInsetsDirectional.all(5),
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 5, 15, 5),
                                    child: viewModel.file == null
                                        ? Row(
                                            children: [
                                              const Icon(
                                                Icons.upload_rounded,
                                                color: kcDarkGreyColor,
                                              ),
                                              horizontalSpaceSmall,
                                              text_helper(
                                                  data: "UploadDocnuments",
                                                  font: poppins,
                                                  bold: true,
                                                  color: kcDarkGreyColor,
                                                  size: fontSize14),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              const Icon(
                                                Icons.description,
                                                color: kcDarkGreyColor,
                                              ),
                                              horizontalSpaceSmall,
                                              text_helper(
                                                  data: viewModel.file!.name,
                                                  font: poppins,
                                                  bold: true,
                                                  color: kcDarkGreyColor,
                                                  size: fontSize14),
                                            ],
                                          ),
                                  ),
                                )
                              ],
                            )
                              .animate(delay: 1700.milliseconds)
                              .fade()
                              .moveY(begin: 50, end: 0)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                button_helper(
                        onpress: () => viewModel.next(context),
                        color: kcPrimaryColor,
                        width: screenWidthCustom(context, 0.5),
                        raduis: 10,
                        padding: const EdgeInsetsDirectional.all(8),
                        child: text_helper(
                          data: "next",
                          font: poppins,
                          color: white,
                          size: fontSize18,
                          bold: true,
                        ))
                    .animate(delay: 1700.milliseconds)
                    .fade()
                    .moveY(begin: 50, end: 0),
              ],
            ),
          ),
        ));
  }

  void showvideo(BuildContext context) {
    VideoPlayerController _controller =
        VideoPlayerController.asset('assets/loginvideo.mp4');
    _controller.initialize().then((_) {
      _controller.play();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                  width: screenWidth(context),
                  color: white,
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : const CircularProgressIndicator()),
            );
          });
    });
    ;
  }

  Widget catdata(SingnupViewModel viewModel, Map e, BuildContext context) {
    return InkWell(
      onTap: () {
        viewModel.intalcat = e['name'];
        viewModel.notifyListeners();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: viewModel.intalcat == e['name']
                      ? getColorWithOpacity(kcPrimaryColor, 0.3)
                      : getColorWithOpacity(kcLightGrey, 0.1),
                  spreadRadius: 2,
                  blurRadius: 2)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              e['img'],
              width: screenWidthCustom(context, 0.15),
              height: screenHeightCustom(context, 0.15),
            ),
            text_helper(
                data: e['name'],
                font: poppins,
                bold: true,
                color: kcDarkGreyColor,
                size: fontSize12)
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(SingnupViewModel viewModel) {
    viewModel.name.dispose();
    viewModel.fathername.dispose();
    viewModel.cnic.dispose();
    viewModel.phone.dispose();
    viewModel.address.dispose();
  }

  @override
  SingnupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingnupViewModel();
}
