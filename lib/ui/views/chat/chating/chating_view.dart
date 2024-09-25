import 'package:flutter/material.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:stacked/stacked.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../../../common/apihelpers/apihelper.dart';
import '../../../common/apihelpers/firebsaeuploadhelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_strings.dart';
import '../../../common/ui_helpers.dart';
import '../../../common/uihelper/snakbar_helper.dart';
import '../../../common/uihelper/text_helper.dart';
import '../../../common/uihelper/text_veiw_helper.dart';
import 'chating_viewmodel.dart';

class ChatingView extends StackedView<ChatingViewModel> {
  ChatingView({Key? key, required this.id, required this.did})
      : super(key: key);
  String id, did;

  @override
  Widget builder(
    BuildContext context,
    ChatingViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () {
        ApiHelper.updateof(viewModel.sharedpref.readString("phone"), "offline");
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: amber,
          iconTheme: const IconThemeData(color: white),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text_helper(
                data: "Chat",
                font: poppins,
                color: white,
                size: fontSize14,
                bold: true,
              ),
              viewModel.sharedpref.readString("phone") != '0000-0000000'
                  ? FutureBuilder(
                      future: ApiHelper.findone(
                          viewModel.sharedpref.readString("phone")),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.circle,
                                color: red,
                                size: 10,
                              ),
                              horizontalSpaceTiny,
                              text_helper(
                                data: snapshot.data['of'].toString(),
                                font: montserrat,
                                color: white,
                                size: fontSize10,
                                textAlign: TextAlign.start,
                              ),
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
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: red,
                          size: 10,
                        ),
                        horizontalSpaceTiny,
                        text_helper(
                          data: "online",
                          font: montserrat,
                          color: white,
                          size: fontSize10,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
            ],
          ),
        ),
        backgroundColor: white,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ApiHelper.allchatbyid(id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['c'].toString() == '[]') {
                      return const Center(
                        child: Text("No Data"),
                      );
                    } else {
                      List l = List.of(snapshot.data['c']).reversed.toList();
                      return ListView.builder(
                        itemCount: l.length,
                        reverse: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: l[index]['sendby'] ==
                                    viewModel.sharedpref.readString("phone")
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: l[index]['sendby'] ==
                                          viewModel.sharedpref
                                              .readString("phone")
                                      ? getColorWithOpacity(Colors.green, 0.3)
                                      : getColorWithOpacity(Colors.amber, 0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    viewModel.sharedpref.readString("phone") !=
                                            '0000-0000000'
                                        ? FutureBuilder(
                                            future: ApiHelper.findone(l[index]['sendby']),
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.hasData) {
                                                return text_helper(
                                                  data: snapshot.data['name']
                                                      .toString(),
                                                  font: montserrat,
                                                  color: kcDarkGreyColor,
                                                  size: fontSize10,
                                                  textAlign: TextAlign.start,
                                                );
                                              } else if (snapshot.hasError) {
                                                return const Icon(
                                                  Icons.error,
                                                  color: kcDarkGreyColor,
                                                );
                                              } else {
                                                return displaysimpleprogress(
                                                    context);
                                              }
                                            },
                                          )
                                        : text_helper(
                                            data: "Admin",
                                            font: montserrat,
                                            color: kcDarkGreyColor,
                                            size: fontSize10,
                                            textAlign: TextAlign.start,
                                          ),
                                    l[index]['voice'] == ""
                                        ? const SizedBox.shrink()
                                        : VoiceMessageView(
                                            controller: VoiceController(
                                              audioSrc: l[index]['voice'],
                                              maxDuration:
                                                  const Duration(minutes: 10),
                                              isFile: false,
                                              onComplete: () {},
                                              onPause: () {},
                                              onPlaying: () {},
                                            ),
                                            backgroundColor: l[index]
                                                        ['sendby'] ==
                                                    viewModel.sharedpref
                                                        .readString("phone")
                                                ? Colors.green.shade400
                                                : Colors.yellow.shade300,
                                            innerPadding: 0,
                                            cornerRadius: 10,
                                          ),
                                    text_helper(
                                      data: l[index]['mess'].toString(),
                                      font: montserrat,
                                      color: kcDarkGreyColor,
                                      size: fontSize12,
                                      bold: true,
                                      textAlign: TextAlign.start,
                                    ),
                                    text_helper(
                                      data: l[index]['date']
                                          .toString()
                                          .substring(0, 15),
                                      font: montserrat,
                                      color: kcDarkGreyColor,
                                      size: fontSize10,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                )),
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Icon(
                      Icons.error,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: screenWidth(context),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    viewModel.v
                        ? Expanded(
                            child: text_view_helper(
                                hint: "Enter Message",
                                showicon: true,
                                icon: const Icon(Icons.chat),
                                background:
                                    getColorWithOpacity(kcVeryLightGrey, 0.4),
                                controller: viewModel.chat))
                        : const SizedBox.shrink(),
                    horizontalSpaceTiny,
                    viewModel.v
                        ? InkWell(
                            onTap: () async {
                              await ApiHelper.addchat(
                                  id,
                                  {
                                    "sendby": viewModel.sharedpref
                                        .readString("phone"),
                                    "mess": viewModel.chat.text,
                                    "voice": "",
                                    "date": DateTime.now().toString()
                                  },
                                  did);
                              viewModel.chat.clear();
                              viewModel.notifyListeners();
                            },
                            child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 15, 5, 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      getColorWithOpacity(kcVeryLightGrey, 0.4),
                                ),
                                child: const Icon(Icons.arrow_forward_ios)),
                          )
                        : const SizedBox.shrink(),
                    horizontalSpaceTiny,
                    Column(
                      children: [
                        verticalSpaceSmall,
                        SizedBox(
                          width: viewModel.v
                              ? null
                              : screenWidthCustom(context, 0.8),
                          child: SocialMediaRecorder(
                            sendRequestFunction: (soundFile, time) async {
                              viewModel.v = true;
                              viewModel.notifyListeners();

                              String url = await FirebaseHelper.uploadFile(
                                  soundFile, "voice");

                              await ApiHelper.addchat(
                                  id,
                                  {
                                    "sendby": viewModel.sharedpref
                                        .readString("phone"),
                                    "mess": viewModel.chat.text,
                                    "voice": url,
                                    "date": DateTime.now().toString()
                                  },
                                  did);
                              viewModel.chat.clear();
                              viewModel.notifyListeners();
                            },
                            startRecording: () {
                              viewModel.v = false;
                              viewModel.notifyListeners();
                            },
                            stopRecording: (soundFile) {
                              viewModel.v = true;
                              viewModel.notifyListeners();
                            },
                            recordIcon: const Icon(Icons.keyboard_voice),
                            initRecordPackageWidth: 40,
                            fullRecordPackageHeight: 40,
                            radius: BorderRadius.circular(10),
                            encode: AudioEncoderType.AAC,
                          ),
                        ),
                      ],
                    ),
                    horizontalSpaceTiny,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(ChatingViewModel viewModel) {
    ApiHelper.updateof(viewModel.sharedpref.readString("phone"), "online");
    super.onViewModelReady(viewModel);
  }

  @override
  ChatingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatingViewModel();
}
